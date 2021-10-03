//
//  AirLinesDetailsViewModel.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import Foundation

struct AirLineDetailsViewModel{
    let name: String
    let country: String
    let slogan: String
    let address: String
    let website : String
    
    init(withAirLine airLine: AirLine){
        self.name = airLine.name ?? ""
        self.country = airLine.country ?? ""
        self.slogan = airLine.slogan ?? ""
        self.address = airLine.headQuaters ?? ""
        self.website = airLine.website ?? ""
    }
}
