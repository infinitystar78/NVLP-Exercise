//
//  IntroViewControllerTest.swift
//  NVLPTests
//
//  Created by Melvin Wijenayaka on 27/10/2020.
//

import XCTest
@testable import NVLP

class IntroViewControllerTest: XCTestCase {

    let sb = UIStoryboard(name: "Main", bundle: nil)
    

    func test_loading() {
        super.setUp()
        let sut : IntroViewController = sb.instantiateViewController(identifier: String(describing: IntroViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.healthCheckLabel, "health_check_label")
        XCTAssertNotNil(sut.healthCheckIndicatorView, "healthCheckIndicatorView")
        XCTAssertNotNil(sut.welcomeTitle, "welcomeTitle")
        XCTAssertNotNil(sut.emailAddressLabel, "emailAddressLabel")
        XCTAssertNotNil(sut.emailTextField, "emailTextField")
        XCTAssertNotNil(sut.emailErrorLabel, "emailErrorLabel")
    }
    

}
