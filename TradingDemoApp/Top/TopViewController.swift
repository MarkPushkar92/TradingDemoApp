//
//  TopViewController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//


import UIKit

class TopViewController: UIViewController {
    
    weak var coordinator: FirstScreenCoordinator?
    
    private var viewModel: TopScreenViewModel
    
    private var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textAlignment = .center
        label.text = "TOP 10 Traders"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.337, green: 0.333, blue: 0.4, alpha: 1)
        tableView.layer.cornerRadius = 10
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TraderTableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1)
        setupViews()
        let _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(updateTradersInfo), userInfo: nil, repeats: true)

    }
    
    @objc private func updateTradersInfo() {
        viewModel.updateProfitAndDeposit {
            self.tableView.reloadData()
        }
    }
    
    init(viewModel: TopScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension TopViewController {
    func setupViews() {
        tabBarController?.tabBar.isHidden = false

        view.addSubview(label)
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        let constraints = [
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 550),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

}


//MARK: EXTENSIONS

extension TopViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.topTraders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TraderTableViewCell
        let trader = viewModel.topTraders[indexPath.row]
        cell.number.text = "\(indexPath.row + 1)"
        cell.countryFlag.image = trader.flag
        cell.name.text = trader.name
        cell.deposit.text = "$\(trader.deposit)"
        cell.profit.text = "$\(trader.profit)"
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor(red: 0.337, green: 0.333, blue: 0.4, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1)
        }
        return cell
        
    }
    
    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = TopTradersHeader()
      
        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension TopViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
}
    

