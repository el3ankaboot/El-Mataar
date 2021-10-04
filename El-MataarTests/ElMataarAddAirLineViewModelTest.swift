//
//  ElMataarAddAirLineViewModelTest.swift
//  El-MataarTests
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import Foundation
import XCTest
@testable import El_Mataar

class ElMataarAddAirLineViewModelTest: XCTestCase {
    
    var viewModel : AddAirLineViewModel!
    var mockService : ElMataarMockService!
    
    override func setUp() {
        //Load data
        self.mockService = ElMataarMockService()
        self.viewModel = AddAirLineViewModel(service: mockService)
    }
    
    //MARK:- Test adding airline
    func testAddAirLine(){
        viewModel.addAirLine()
        XCTAssertTrue(viewModel.success.value, "The success variable's value didn't change to true although the API returned successfully")
    }
}
