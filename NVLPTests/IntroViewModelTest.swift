//
//  IntroViewModelTest.swift
//  NVLPTests
//
//  Created by Melvin Wijenayaka on 27/10/2020.
//

import XCTest
@testable import NVLP

class IntroViewModelTest: XCTestCase {

 
    func test_validateEmailAddress(){
        let emailAddress = "melvinwijenayaka@gmail.com"
        XCTAssertTrue(emailAddress.validateEmail(), "validateEmail")
     
        let invalidEmailAddress = "sfsdds"
        XCTAssertFalse(invalidEmailAddress.validateEmail(), "validateEmail")
    }
    
    
    func test_formatting(){
        let sut = IntroViewModel()
        XCTAssertEqual(sut.errorColor, UIColor.red, "error_color")
        XCTAssertEqual(sut.buttonFont, UIFont.boldSystemFont(ofSize: 16), "button_font")
        XCTAssertEqual(sut.titleFont, UIFont.boldSystemFont(ofSize: 22), "title_font")
        XCTAssertEqual(sut.bodyFont, UIFont.boldSystemFont(ofSize: 14), "body_font")
        XCTAssertEqual(sut.incorrectEmailMessage, "Email format is not correct, please try again", "incorrectEmail_message")
        XCTAssertEqual(sut.instructionText, "Please enter your Email Address", "instruction_text")
        XCTAssertEqual(sut.introMessage, "Welcome", "intro_message")
        XCTAssertEqual(sut.buttonText, "Next", "button_text")
    }
    
    

}




