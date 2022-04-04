//
//  ViewController.swift
//  CustomAlert
//
//  Created by Alexander Avdacev on 4.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    let goAlertButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customAlert = CustomAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        goAlertButton.addTarget(self,
                                action: #selector(goAlertButtonTapped),
                                for: .touchUpInside)
    }
    
    @objc func goAlertButtonTapped() {
        
    customAlert.showAlert(with: "Hello my friend",
                          message: "This is my custom alert that is show. This is my custom alert that is show. This is my custom alert that is show.",
                          on: self)
    }
    
    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }

    func setConstraints() {
    view.addSubview(goAlertButton)
    NSLayoutConstraint.activate([
    goAlertButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
    goAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    goAlertButton.heightAnchor.constraint(equalToConstant: 70),
    goAlertButton.widthAnchor.constraint(equalToConstant: 300)
    ])
    }
}

