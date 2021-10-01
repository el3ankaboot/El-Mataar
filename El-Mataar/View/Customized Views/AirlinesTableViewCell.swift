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
        contentView.showShadow()
    }
    //MARK: Helpers
    func setupInset(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 5, right: 20))
    }
    
    

}
