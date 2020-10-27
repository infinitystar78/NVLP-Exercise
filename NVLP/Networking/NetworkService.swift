//
//  NetworkService.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 18/10/2020.
//

import Foundation

enum NetworkService : ServiceProtocol {
    
    case login
    case healthcheck
    
    var token : String{
        return Token.retrieveToken()
    }
    
    var baseURL: URL{
        return URL(string: "http://54.179.251.89:8080")!
    }
    
    var path: String{
        switch self{
        case .login:
            return "login"
        case .healthcheck:
            return "healthcheck"
        }
    }
    
    var method: HTTPMethod{
        return .get
    }
    
    var task: Task{
        return .requestPlain
    }
    
    var headers: Headers?{
        switch self{
        case .login:
            return ["Content-Type":"application/json"]
        case .healthcheck:
            return ["Content-Type":"application/json", "X_JWT": token]
        }
        
        
        
    }
    
    var parametersEncoding: ParametersEncoding{
        return .url
    }
    
    
    
    
    
    
    
}
