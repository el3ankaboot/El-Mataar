//
//  AddAirLineViewModel.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import Foundation

class AddAirLineViewModel {
    
    //MARK: Variables
    var fail: Observable<Bool> = Observable(false)
    var success : Observable<Bool> = Observable(false)
    var successMessage: String = ""
    
    //MARK: Injections
    var service: ElMataarServiceProtocol!
    
    //MARK:- Init
    init(service: ElMataarServiceProtocol) {
        self.service = service
    }
    
    func addAirLine(){
        service.addAirLine { airLine in
            self.successMessage = "\(airLine.name ?? "The Air Line") was added successfully"
            self.success.value = true
        } onError: {
            self.fail.value = true
        }

    }
}
