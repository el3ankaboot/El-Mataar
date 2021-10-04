//
//  AirLinesTableViewModel.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 03/10/2021.
//

import Foundation

struct AirLinesTableCellViewModel {
    let id : Int
    let name : String
}

class AirLinesTableViewModel {
    //MARK: Variables
    var airLinesDataSource : Observable<[AirLinesTableCellViewModel]> = Observable([])
    var allAirLines : AirLines = [] //To Handle Search and forming DetailsViewModel
    
    var didFail : Observable<Bool> = Observable(false)
    
    //MARK: Injections
    var service: ElMataarServiceProtocol!
    
    //MARK:- Init
    init(service: ElMataarServiceProtocol) {
        self.service = service
    }
    
    //MARK: TableView
    func getAirLineForRow(_ row: Int) -> AirLinesTableCellViewModel{
        return airLinesDataSource.value[row]
    }
    func getAirLinesTableViewCount()-> Int{
        return airLinesDataSource.value.count
    }
    func handleCellSelection(_ cellIndex: Int){
        var airLine: AirLine? = nil
        if allAirLines.count == airLinesDataSource.value.count {
            //No Search
            airLine = allAirLines[cellIndex]
        }
        else {
            //Search is applied
            airLine = allAirLines.first(where: { airline in
                airline.id == airLinesDataSource.value[cellIndex].id
            })
        }
        if let airLine = airLine{
            let viewModel = AirLineDetailsViewModel(withAirLine: airLine)
            Router.navigateTo(.airLineDetails(airLineDetailsViewModel: viewModel))
        }
        
    }
    
    //MARK: Fetch Data
    func getData(){
        service.getAirLines(onSuccess: { (response) in
            self.airLinesDataSource.value = response.compactMap({ airLine in
                AirLinesTableCellViewModel(id: airLine.id ?? 0, name: airLine.name ?? "")
            })
            self.allAirLines = response
        }) {
            self.didFail.value = true
        }
        
    }
    
    //MARK: Search
    func search(forName name: String){
        //Retrun to original state first
        self.airLinesDataSource.value = allAirLines.compactMap({ airLine in
            AirLinesTableCellViewModel(id: airLine.id ?? 0, name: airLine.name ?? "")
        })
        if name != "" {
            //Filter from all data
            self.airLinesDataSource.value = self.airLinesDataSource.value.filter({ airLine in
                airLine.name.lowercased().contains(name.lowercased())
            })
        }
    }
}
