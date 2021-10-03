//
//  ElMataarAPIClient+requests.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 03/10/2021.
//

import Foundation

extension ElMataarAPIClient {
    func getAirLines(onSuccess: ((AirLines)-> Void)?, onError: (()->Void)?){
        launchJSONRequest(verb: .get, onSuccess: onSuccess, onError: onError)
    }
    
    func addAirLine(onSuccess: ((AirLine)-> Void)?, onError: (()->Void)?){
        launchJSONRequest(verb: .post, onSuccess: onSuccess, onError: onError)
    }
}
