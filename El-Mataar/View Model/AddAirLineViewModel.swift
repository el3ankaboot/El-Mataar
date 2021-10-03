//
//  AddAirLineViewModel.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import Foundation

class AddAirLineViewModel {
    var fail: Observable<Bool> = Observable(false)
    var success : Observable<Bool> = Observable(false)
    var successMessage: String = ""
    
    func addAirLine(){
        ElMataarAPIClient.shared.addAirLine { airLine in
            self.successMessage = "\(airLine.name ?? "The Air Line") was added successfully"
            self.success.value = true
        } onError: {
            self.fail.value = true
        }

    }
}
