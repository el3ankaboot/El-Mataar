//
//  AirLineDetailsViewController.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 02/10/2021.
//

import Foundation
import UIKit

class AirLineDetailsViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var detailsView: UIView!
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        detailsView.showShadow()
    }
}
