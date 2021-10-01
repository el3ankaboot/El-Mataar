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
        navigationController?.navigationBar.tintColor = UIColor(named: "App Tint Color")
    }
    func showNavBarShadow(){
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowRadius = 5.0
        navigationController?.navigationBar.layer.shadowOpacity = 0.7
        navigationController?.navigationBar.layer.masksToBounds = false
    }
    func setupNavigationBarTitleFont(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Vodafone Rg Regular", size: 24)!]
    }
    func removeBackButtonTitle(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
