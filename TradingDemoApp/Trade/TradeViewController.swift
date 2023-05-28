//
//  TradeViewController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit


class TradeViewController: UIViewController {
    
    //MARK: Properties
    
    weak var coordinator: SecondScreenCoordinator?
    
    private let viewModel: TradeViewModel
    
    private let tradeView = TradeView()
    
    //MARK: LIfeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tradeView.currencyButton.addTarget(self, action: #selector(pickNewCurrencyPair), for: .touchUpInside)
        self.hideKeyboardWhenTappedAround()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        applyData()
        let strIndex = self.viewModel.currentCurrencyPair.index(viewModel.currentCurrencyPair.startIndex, offsetBy: 3)
        var newButtonTitle = self.viewModel.currentCurrencyPair
        newButtonTitle.insert("/", at: strIndex)
        self.tradeView.currencyButton.setTitle(newButtonTitle, for: .normal)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    init(viewModel: TradeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Funcs

    private func applyData() {
        if let url = URL(string: self.viewModel.getURL()) {
            DispatchQueue.main.async {
                self.tradeView.webView.load(URLRequest(url: url))
                self.tradeView.webView.reload()
            }
        }
    }
    
    @objc private func pickNewCurrencyPair() {
        viewModel.onTapShowNextModule()
    }
    
    @objc private func reduceTimeForABid() {
        if let stringToUpdate = tradeView.timerView.textField.text {
            let componets = stringToUpdate.components(separatedBy: ":")
            var hours = Int(componets[0]) ?? 0
            var minutes = Int(componets[1]) ?? 0
            if minutes  > 0 {
                minutes -= 1
            } else {
                hours -= 1
                minutes = 59
                if hours < 0 {
                    hours = 0
                }
            }
            let strMinutes = {
                if minutes < 10 {
                    return "0" + String(minutes)
                } else {
                    return String(minutes)
                }
            }
            let strHours = String(hours)
            let newTimerStr = strHours + ":" + strMinutes()
            print(newTimerStr)
            tradeView.timerView.textField.text = newTimerStr
        }
    }
    
    @objc private func increaseTimeForABid() {
        if let stringToUpdate = tradeView.timerView.textField.text {
            let componets = stringToUpdate.components(separatedBy: ":")
            var hours = Int(componets[0]) ?? 0
            var minutes = Int(componets[1]) ?? 0
            if minutes < 59 {
                minutes += 1
            } else if minutes == 59 {
                hours += 1
                minutes = 00
                if hours < 0 {
                    hours = 0
                }
            }
            let strMinutes = {
                if minutes < 10 {
                    return "0" + String(minutes)
                } else {
                    return String(minutes)
                }
            }
            let strHours = String(hours)
            let newTimerStr = strHours + ":" + strMinutes()
            print(newTimerStr)
            tradeView.timerView.textField.text = newTimerStr
        }
    }
    
    @objc private func reduceABid() {
        if let stringToUpdate = tradeView.bidView.textField.text {
            let comaIndex = stringToUpdate.index(stringToUpdate.endIndex, offsetBy: -3)
            if let intBid = Int(stringToUpdate.replacingOccurrences(of: ",", with: "")) {
                if intBid >= 100 {
                    let newBid = intBid - 100
                    var newBidString = String(newBid)
                    if newBidString.count > 3 {
                        newBidString.insert(",", at: comaIndex)
                        tradeView.bidView.textField.text = newBidString
                    } else {
                        tradeView.bidView.textField.text = newBidString
                    }
                }
            }
        }
    }
    
    @objc private func increaseABid() {
        if let stringToUpdate = tradeView.bidView.textField.text {
            if let intBid = Int(stringToUpdate.replacingOccurrences(of: ",", with: "")) {
                if intBid < viewModel.balance {
                    var newBid = intBid + 100
                    if newBid > viewModel.balance {
                        newBid = viewModel.balance
                    }
                    var newBidString = String(newBid)
                    if newBidString.count > 3 {
                        let comaIndex = newBidString.index(newBidString.endIndex, offsetBy: -3)
                        newBidString.insert(",", at: comaIndex)
                        tradeView.bidView.textField.text = newBidString
                    } else {
                        tradeView.bidView.textField.text = newBidString
                    }
                }
            }
        }
    }
    
    //MARK: KeyBoard Setup

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 90
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

//MARK: extensions

private extension TradeViewController {
    func setupViews() {
        
        tradeView.balanceLabel.text = String(viewModel.balance.formatted()).replacingOccurrences(of: ",", with: " ")
        
        tradeView.bidView.textField.delegate = self
        tradeView.timerView.textField.delegate = self
                
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
        view.addSubviews(tradeView)
        let constraints = [
            
            tradeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tradeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tradeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tradeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
        ]
        NSLayoutConstraint.activate(constraints)
        
        //targeting buttons
        
        tradeView.timerView.minusButton.addTarget(self, action: #selector(reduceTimeForABid), for: .touchUpInside)
        tradeView.timerView.plusButton.addTarget(self, action: #selector(increaseTimeForABid), for: .touchUpInside)
        tradeView.bidView.minusButton.addTarget(self, action: #selector(reduceABid), for: .touchUpInside)
        tradeView.bidView.plusButton.addTarget(self, action: #selector(increaseABid), for: .touchUpInside)


        
    }
}

//MARK: textFields


extension TradeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.placeholder == "Set timer"  {
            tradeView.timerView.layer.borderWidth = 2
            tradeView.timerView.layer.borderColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1).cgColor

        } else {
            tradeView.bidView.layer.borderWidth = 2
            tradeView.bidView.layer.borderColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1).cgColor

        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == "Set timer"  {
            tradeView.timerView.layer.borderWidth = 0
            if let updatingText = textField.text {
                var updatedText = updatingText
                let colomnIndex = updatedText.index(updatedText.startIndex, offsetBy: 2)
                updatedText.insert(":", at: colomnIndex)
                let componets = updatedText.components(separatedBy: ":")
                let minutes = Int(componets[1]) ?? 0
                if minutes > 59 {
                    textField.text = componets[0] + ":" + "00"
                } else {
                    textField.text = updatedText

                }
            }
        } else {
            tradeView.bidView.layer.borderWidth = 0
            if let updatingText = textField.text, textField.text?.count ?? 0 > 3 {
                var updatedText = updatingText
                let colomnIndex = updatedText.index(updatedText.endIndex, offsetBy: -3)
                if let bid = Int(updatedText.replacingOccurrences(of: ",", with: "")) {
                    if bid > viewModel.balance {
                        textField.text = String(viewModel.balance)
                    } else {
                        updatedText.insert(",", at: colomnIndex)
                        textField.text = updatedText
                    }
                }
                
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
        if textField.placeholder == "Set timer"  {
          
            return updatedText.count <= 4
            
        } else {
            return updatedText.count <= 5
        }

    }
        
    
}

