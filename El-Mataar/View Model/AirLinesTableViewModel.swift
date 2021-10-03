//
//  AirLinesTableViewModel.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 03/10/2021.
//

import Foundation

struct AirLinesTableCellViewModel {
    let name : String
}

struct AirLinesTableViewModel {
    var airLinesDataSource : Observable<[AirLinesTableCellViewModel]> = Observable([])
    var allAirLines : [AirLinesTableCellViewModel] = [] //To Handle Search
    
    var didFail : Observable<Bool> = Observable(false)
    
    //MARK: TableView
    func getAirLineForRow(_ row: Int) -> AirLinesTableCellViewModel{
        return airLinesDataSource.value[row]
    }
    func getAirLinesTableViewCount()-> Int{
        return airLinesDataSource.value.count
    }
    func handleCellSelection(_ cellIndex: Int){
        Router.navigateTo(.airLineDetails)
    }
    
    //MARK: Fetch Data
    func getData(){
        ElMataarAPIClient.shared.getAirLines { response in
            self.airLinesDataSource.value = response.compactMap({ airLine in
                AirLinesTableCellViewModel(name: airLine.name ?? "")
            })
        } onError: {
            self.didFail.value = true
        }

    }
}
