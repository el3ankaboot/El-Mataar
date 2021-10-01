//
//  AirlinesTableViewCell.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import UIKit

class AirlinesTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var airlineNameLabel: UILabel!
    

    //MARK:- Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupInset()
        setupShadow()
    }
    //MARK: Helpers
    func setupInset(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 5, right: 20))
    }
    
    func setupShadow(){
        contentView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        contentView.layer.shadowRadius = 4.0
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.masksToBounds = false
    }
    
    

}
