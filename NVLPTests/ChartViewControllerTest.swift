//
//  ChartViewControllerTest.swift
//  NVLPTests
//
//  Created by Melvin Wijenayaka on 27/10/2020.
//

import XCTest
@testable import NVLP

class ChartViewControllerTest: XCTestCase {

  
    let sb = UIStoryboard(name: "Main", bundle: nil)
    

    func test_loading() {
        super.setUp()
        let sut : ChartViewController = sb.instantiateViewController(identifier: String(describing: ChartViewControllerTest.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.barChartView, "bar_chart_view")
        XCTAssertNotNil(sut.currency_1, "currency_1")
        XCTAssertNotNil(sut.currency_1_change, "currency_1_change")
        XCTAssertNotNil(sut.currency_2, "currency_2")
        XCTAssertNotNil(sut.currency_2_change, "currency_2_change")
        XCTAssertNotNil(sut.currency_3, "currency_3")
        XCTAssertNotNil(sut.currency_3_change, "currency_3_change")
        XCTAssertNotNil(sut.currency_4, "currency_4")
        XCTAssertNotNil(sut.currency_4_change, "currency_4_change")
        XCTAssertNotNil(sut.currency_5, "currency_5")
        XCTAssertNotNil(sut.currency_5_change, "currency_1_change")
        XCTAssertNotNil(sut.currency_6, "currency_5")
        XCTAssertNotNil(sut.currency_6_change, "currency_6_change")
        XCTAssertNotNil(sut.currency_7, "currency_6")
        XCTAssertNotNil(sut.currency_7_change, "currency_7_change")
        XCTAssertNotNil(sut.currency_8, "currency_8")
        XCTAssertNotNil(sut.currency_8_change, "currency_8_change")
    }
    
    
    
    
}
