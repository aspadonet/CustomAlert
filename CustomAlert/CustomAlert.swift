//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by Alexander Avdacev on 4.04.22.
//

import Foundation
import UIKit

class CustomAlert {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    var mytargetView: UIView?
    
    func showAlert(with title: String? = "Hello my friend",
                   message: String? = "",
                   on viewController: UIViewController) {
         
        guard let targetView = viewController.view else {
            return
        }
        mytargetView         = targetView
        backgroundView.frame = targetView.bounds
        
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.size.width - 80,
                                 height: 300)
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 0,
                                               width: alertView.frame.size.width,
                                               height: 80))
        titleLabel.text          = title
        titleLabel.textAlignment = .center
        
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 0,
                                                 y: 80,
                                                 width: alertView.frame.size.width,
                                                 height: 170))
        messageLabel.numberOfLines   = 0
        messageLabel.text            = message
        messageLabel.textAlignment   = .left
        
        alertView.addSubview(messageLabel)
        
        let button = UIButton(frame: CGRect(x: 0,
                                                 y: alertView.frame.size.height - 50,
                                                 width: alertView.frame.size.width,
                                                 height: 50))
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        alertView.addSubview(button)
        
        UIView.animate(withDuration: 0.25) {
            
            self.backgroundView.alpha = Constants.backgroundAlphaTo
            
        } completion: { done in
            
            if done {
                UIView.animate(withDuration: 0.25) {
                    self.alertView.center = targetView.center
                }
            }
        }
    }
    
    @objc func dismissAlert() {
        
        guard let targetView = mytargetView else {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            self.alertView.frame = CGRect(x: 40,
                                          y:targetView.frame.size.height,
                                          width: targetView.frame.size.width - 80,
                                          height: 300)
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.25) {
                    self.backgroundView.alpha = 0
                } completion: { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }

