//
//  PreLoaderController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 29.05.2023.
//

import UIKit


class PreLoaderController: UIViewController {
    
    //MARK: Properties
    
    var goFurther: (() -> Void)?
    
    weak var coordinator: FirstScreenCoordinator?
    
    private var progress: Float = 0
    
    private var timer = Timer()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(progress, animated: true)
        progressView.trackTintColor = UIColor(red: 0.357, green: 0.353, blue: 0.376, alpha: 1)
        progressView.tintColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        progressView.layer.cornerRadius = 12
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 12
        progressView.subviews[1].clipsToBounds = true
        progressView.toAutoLayout()
        return progressView
    }()
    
    private let percentLabel: UILabel = {
        var label = UILabel()
        label.toAutoLayout()
        label.text = "0 %"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()


    //MARK: LIfeCycle, Init
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        view.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
        view.addSubview(progressView)
        view.addSubview(percentLabel)

        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
        
        
        let constraints = [
            
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 300),
            progressView.heightAnchor.constraint(equalToConstant: 24),
            
            percentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
        ]
        NSLayoutConstraint.activate(constraints)
        
      
    }
    
    //MARK: Funcs
    
    @objc private func updateView() {
        if progress < 1 {
            progress += 0.1
            percentLabel.text = "\(Int(progress * 100))%"
            progressView.setProgress(progress, animated: true)
        } else {
            timer.invalidate()
            
            self.goFurther!()

            
        }
    }
        
   
}


