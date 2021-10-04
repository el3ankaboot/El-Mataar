//
//  ElMataarAirLinesDetailsViewModelTest.swift
//  El-MataarTests
//
//  Created by Gamal Mostafa on 04/10/2021.
//

import XCTest
@testable import El_Mataar

class ElMataarAirLineDetailsViewModelTest: XCTestCase {

    var viewModel : AirLineDetailsViewModel!
    
    //Constants to test with
    let kAirLineName = "Air Line Details"
    let kCountry = "Country"
    let kSlogan = "Slogan"
    let kHeadQuarters = "HQ"
    let kWebsite = "https://www.google.com/"
    
    override func setUp()  {
        let airLine = AirLine(id: 10, name: kAirLineName, country: kCountry, logo: nil, slogan: kSlogan, headQuaters: kHeadQuarters, website: kWebsite, established: nil, requestedID: nil)
        viewModel = AirLineDetailsViewModel(withAirLine: airLine)
    }
    
    //Test data is converted correctly to view model
    func testConversionToViewModel(){
        XCTAssertEqual(viewModel.name, kAirLineName, "Expected air line name to be \(kAirLineName), but was \(viewModel.name)")
        XCTAssertEqual(viewModel.country, kCountry, "Expected air line country to be \(kCountry), but was \(viewModel.country)")
        XCTAssertEqual(viewModel.slogan, kSlogan, "Expected air line slogan to be \(kSlogan), but was \(viewModel.slogan)")
        XCTAssertEqual(viewModel.headQuarters, kHeadQuarters, "Expected air line headquarters address to be \(kHeadQuarters), but was \(viewModel.headQuarters)")
        XCTAssertEqual(viewModel.website, kWebsite, "Expected air line website to be \"\(kWebsite)\", but was \(viewModel.website)")
    }

}
