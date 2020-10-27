//
//  SSEConnection.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 19/10/2020.
//

import Foundation
import Alamofire

class SSEConnection{
   
    var constant_endpoint = "http://54.179.251.89:3000"
    var constant_token_header = "X-JWT"
    var constant_content_type_header = "Content-Type"
    var constant_content_type_value = "application/json"
    
    public func connectToEventSource(completionHandler:@escaping(Bool)->()){
           let endpoint = URL(string: constant_endpoint)!
        _ = Session.default.eventSourceRequest(endpoint, headers:[constant_content_type_header: constant_content_type_value, constant_token_header: Token.retrieveToken()], lastEventID: "0").responseEventSource { eventSource in
            completionHandler(true)
            switch eventSource.event {
            case .message( _):
                print("1.Event source received message:", eventSource.event)
            case .complete(let completion):
                print("2.Event source completed:", completion)
            }
        }
   
    }

}
