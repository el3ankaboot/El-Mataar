//
//  ElMataarMockService.swift
//  El-MataarTests
//
//  Created by Gamal Mostafa on 01/10/2021.
//

import XCTest
@testable import El_Mataar

final class ElMataarMockService : ElMataarServiceProtocol{
    func getAirLines(onSuccess: ((AirLines) -> Void)?, onError: (() -> Void)?) {
        var airLines : AirLines = []
        for i in 1...10{
            let airLine = AirLine(id: i, name: "AirLine\(i)", country: "Country\(i)", logo: nil, slogan: "Slogan\(i)", headQuaters: "HQ\(i)", website: "https://www.google.com/", established: nil, requestedID: nil)
            airLines.append(airLine)
        }
        onSuccess!(airLines)
    }
    
    func addAirLine(onSuccess: ((AirLine) -> Void)?, onError: (() -> Void)?) {
        
    }
    

}
