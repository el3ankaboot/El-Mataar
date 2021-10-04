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
    @IBOutlet weak var airLineNameLabel: UILabel!
    @IBOutlet weak var airLineCountryLabel: UILabel!
    @IBOutlet weak var airLineSloganLabel: UILabel!
    @IBOutlet weak var airLineHeadQuartersAddressLabel: UILabel!
    
    //MARK:- Injections
    var viewModel: AirLineDetailsViewModel!
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        detailsView.showShadow()
        fillTheData()
    }
    
    //MARK: filling Data from View Model
    func fillTheData(){
        self.airLineNameLabel.text = viewModel.name
        self.airLineCountryLabel.text = viewModel.country
        self.airLineSloganLabel.text = viewModel.slogan
        self.airLineHeadQuartersAddressLabel.text = viewModel.headQuarters
    }
    
    //MARK:- Actions
    @IBAction func didPressVisit(_ sender: Any) {
        viewModel.goToWebsite()
    }
}
