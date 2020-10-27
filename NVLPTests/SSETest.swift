//
//  SSETest.swift
//  NVLPTests
//
//  Created by Melvin Wijenayaka on 27/10/2020.
//

import XCTest
@testable import NVLP

class SSETest: XCTestCase {
    
    let sut = SSEConnection()
    
    func test_SSEclass_endpoint(){
        XCTAssertEqual(sut.constant_endpoint, "http://54.179.251.89:3000", "sse.endpoint.test")
  
    }

    func test_SSEclass_token_header(){
        XCTAssertEqual(sut.constant_token_header, "X-JWT", "token_header")
  
    }
    
    func test_SSEclass_headers(){
        XCTAssertEqual(sut.constant_content_type_header, "Content-Type", "content_type")
  
    }
    
    func test_SSEclass_value(){
        XCTAssertEqual(sut.constant_content_type_value, "Content-Type", "application/json")
  
    }

}

