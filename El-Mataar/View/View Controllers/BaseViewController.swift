//
//  BaseViewController.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import Foundation
import UIKit

class BaseViewController : UIViewController{
    //MARK:- Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    //MARK: NavBar Setup
    func setupNavigationBar(){
        setNavBarColorToWhite()
        showNavBarShadow()
        setupNavigationBarTitleFont()
        removeBackButtonTitle()
        
    }
    func setNavBarColorToWhite(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor(named: K.appTintColor)
    }
    func showNavBarShadow(){
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowRadius = 5.0
        navigationController?.navigationBar.layer.shadowOpacity = 0.7
        navigationController?.navigationBar.layer.masksToBounds = false
    }
    func setupNavigationBarTitleFont(){
        if let vodafoneFont = UIFont(name: K.vodafoneRgRegular, size: 24){
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: vodafoneFont]
        }
    }
    func removeBackButtonTitle(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    //MARK: Alert
    func showAlertMessage(title: String , message: String , okBtnAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okTitle = "Ok"
        alert.addAction(UIAlertAction(title: okTitle, style: .default, handler: { (action) in
            okBtnAction?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(){
        showAlertMessage(title: "Error", message: "Something went wrong", okBtnAction: nil)
    }
    
    //MARK: ActivityIndicator
    func animateActivityIndicator(_ activityIndicator:UIActivityIndicatorView){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func stopAnimating(_ activityIndicator:UIActivityIndicatorView){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
