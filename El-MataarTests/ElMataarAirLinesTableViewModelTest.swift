//
//  ElMataarAirLinesTableViewModelTest.swift
//  El-MataarTests
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import Foundation
import XCTest
@testable import El_Mataar

class ElMataarAirLinesTableViewModelTest: XCTestCase {
    
    var viewModel : AirLinesTableViewModel!
    var mockService : ElMataarMockService!

    override func setUp() {
        //Load data
        self.mockService = ElMataarMockService()
        self.viewModel = AirLinesTableViewModel(service: mockService)
        viewModel.getData()
    }
    
    //MARK:- Testing The Data Count
    //Test the total count is loaded correctly
    func testAirLinesCount(){
        XCTAssertEqual(viewModel.airLinesDataSource.value.count, 10, "The ViewModel should load 10 airlines not \(viewModel.airLinesDataSource.value.count)")
    }
    
    //MARK:- Testing The Data Loading
    //Test loaded first air line correctly
    func testLoadFirstAirLineCorrectly(){
        let firstAirLine = viewModel.airLinesDataSource.value[0]
        XCTAssertEqual(firstAirLine.id, 1, "The first airline was expected to have id 1, but it returned \(firstAirLine.id)")
        XCTAssertEqual(firstAirLine.name, "AirLine1", "The first airline was expected to have name AirLine1, but it returned \(firstAirLine.name)")
    }
    
    //Test loaded second air line correctly
    func testLoadSecondAirLineCorrectly(){
        let secondAirLine = viewModel.airLinesDataSource.value[1]
        XCTAssertEqual(secondAirLine.id, 2, "The second airline was expected to have id 2, but it returned \(secondAirLine.id)")
        XCTAssertEqual(secondAirLine.name, "AirLine2", "The second airline was expected to have name AirLine2, but it returned \(secondAirLine.name)")
    }
    
    //Test loaded last(tenth) air line correctly
    func testLoadlastAirLineCorrectly(){
        let tenthAirLine = viewModel.airLinesDataSource.value[9]
        XCTAssertEqual(tenthAirLine.id, 10, "The tenth airline was expected to have id 10, but it returned \(tenthAirLine.id)")
        XCTAssertEqual(tenthAirLine.name, "AirLine10", "The tenth airline was expected to have name AirLine10, but it returned \(tenthAirLine.name)")
    }
    
    //MARK:- Testing The Search
    //Test Search correctly - the whole word
    func testSearchWholeWord(){
        viewModel.search(forName: "AirLine2")
        XCTAssertEqual(viewModel.airLinesDataSource.value.count, 1, "Searching for AirLine2 should have returned only one entry not \(viewModel.airLinesDataSource.value.count)")
    }
    
    //Test search correctly - part of the word
    func testSearchPartOfWord(){
        viewModel.search(forName: "ine1")
        XCTAssertEqual(viewModel.airLinesDataSource.value.count, 2, "Searching for ine1 should have returned 2 entries not \(viewModel.airLinesDataSource.value.count)")
    }
    
    //Test search correctly - case insensitive
    func testSearchCaseInsensitive(){
        viewModel.search(forName: "airline")
        XCTAssertEqual(viewModel.airLinesDataSource.value.count, 10 , "Searching for airline (case insensitive) should have returned 10 entries not \(viewModel.airLinesDataSource.value.count)")
    }
    
    //Test search correctly - Two consecutive searches don't affect each other
    func testSearchConsecutive(){
        viewModel.search(forName: "line2")
        viewModel.search(forName: "line")
        XCTAssertEqual(viewModel.airLinesDataSource.value.count, 10, "Searching for line should return 10 entries even after searching or another name, but it returned \(viewModel.airLinesDataSource.value.count)")
    }
    
    
    

}
