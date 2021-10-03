//
//  AirLine.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 03/10/2021.
//

import Foundation


struct AirLine: Codable {
    let id: Int?
    let name, country: String?
    let logo: String?
    let slogan, headQuaters, website, established: String?
    let requestedID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, country, logo, slogan
        case headQuaters = "head_quaters"
        case website, established
        case requestedID = "requestedId"
    }
}

typealias AirLines = [AirLine]
