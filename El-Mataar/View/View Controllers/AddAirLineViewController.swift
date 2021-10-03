//
//  AddAirLineViewController.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 02/10/2021.
//

import Foundation
import UIKit

class AddAirLineViewController : BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sloganTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var headQuartersTextField: UITextField!
    @IBOutlet weak var cancelTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Variables
    private var viewModel = AddAirLineViewModel()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }
    
    
    //MARK:- Actions
    @IBAction func didPressConfirm(_ sender: Any) {
        guard nameTextField.isNotEmpty() && sloganTextField.isNotEmpty() && countryTextField.isNotEmpty() && headQuartersTextField.isNotEmpty() && cancelTextField.isNotEmpty() else {
            showAlertMessage(title: "Please fill all textfields", message: "", okBtnAction: nil)
            return
        }
        addAirLine()
    }
    
    @IBAction func didPressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addAirLine(){
        animateActivityIndicator(activityIndicator)
        viewModel.addAirLine()
        viewModel.success.bind {[weak self] success in
            if success {
                self?.showAlertMessage(title: "Success", message: self?.viewModel.successMessage ?? "", okBtnAction: {
                    self?.dismiss(animated: true, completion: nil)
                })
            }
            if let activityIndicator = self?.activityIndicator {
                self?.stopAnimating(activityIndicator)
            }
        }
        viewModel.fail.bind {[weak self] fail in
            if fail {
                self?.showErrorAlert()
            }
            if let activityIndicator = self?.activityIndicator {
                self?.stopAnimating(activityIndicator)
            }
        }
    }
}

