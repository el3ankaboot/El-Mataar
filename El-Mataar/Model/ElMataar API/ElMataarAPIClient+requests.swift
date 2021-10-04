//
//  ElMataarAPIClient+requests.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 03/10/2021.
//

import Foundation

protocol ElMataarServiceProtocol {
    func getAirLines(onSuccess: ((AirLines)-> Void)?, onError: (()->Void)?)
    func addAirLine(onSuccess: ((AirLine)-> Void)?, onError: (()->Void)?)
}

class ElMataarService : ElMataarServiceProtocol {
    func getAirLines(onSuccess: ((AirLines)-> Void)?, onError: (()->Void)?){
        ElMataarAPIClient.shared.launchJSONRequest(verb: .get, onSuccess: onSuccess, onError: onError)
    }
    func addAirLine(onSuccess: ((AirLine)-> Void)?, onError: (()->Void)?){
        ElMataarAPIClient.shared.launchJSONRequest(verb: .post, onSuccess: onSuccess, onError: onError)
    }
}
