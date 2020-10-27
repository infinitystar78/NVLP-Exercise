//
//  ChartViewModelTest.swift
//  NVLPTests
//
//  Created by Melvin Wijenayaka on 27/10/2020.
//

import XCTest
@testable import NVLP

class ChartViewModelTest: XCTestCase {


    func test_change_calculation(){
        let sut = ChartViewModel()
        let previous = [Currency(_key: "gbp", _value: 56, _name: "GBP"), Currency(_key: "usd", _value: 78, _name: "USD"),Currency(_key: "btc", _value: 89, _name: "BTC")]
        let current = [Currency(_key: "gbp", _value: 145, _name: "GBP"), Currency(_key: "usd", _value: 30, _name: "USD"),Currency(_key: "btc", _value: 89, _name: "BTC")]
        
         let changes = sut.calculateChange(with: previous, and: current)
         let testCase = ["BTC": 0, "GBP": 89, "USD": -48]
         XCTAssertEqual(changes, testCase)
        
    }
    
    
    

}
