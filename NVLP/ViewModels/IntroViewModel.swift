//
//  IntroViewModel.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 17/10/2020.
//

import Foundation
import UIKit

struct IntroViewModel{
    
   public var emailAddress : String?
   private let sessionProvider = URLSessionProvider()

    func validateEmailAddress(completionHandler:@escaping(Bool)->()){
        if self.emailAddress?.validateEmail() == true{
            completionHandler(true)
        }else if self.emailAddress?.validateEmail() == false{
            completionHandler(false)
        }
    }

}

extension IntroViewModel{
    
    private var health : Bool{
        return true
    }
    //get healthCheck api
    func getHealthCheckStatus(completionHandler:@escaping(Bool)->()){
        sessionProvider.request(type: HealthCheck.self, service: NetworkService.healthcheck) { (response) in
            switch response{
            case let .success(healthcheck):
                print(healthcheck)
                completionHandler(true)
            case let.failure(error):
                print(error)
                completionHandler(false)
            }
        }
    }
    // get authorisation token
    func getToken(completionHandler:@escaping(Bool)->()){
        sessionProvider.request(type: TokenModel.self, service:  NetworkService.login) { (response) in
            switch response{
            case let .success(token):
                _  = Token.saveToken(accessToken: token.token)
                completionHandler(true)
            case let.failure(error):
                print(error)
                completionHandler(false)
            }
        }
    }
    
}


extension IntroViewModel{
    
    public var errorColor : UIColor{
        return UIColor.red
    }
    
    public var buttonFont : UIFont{
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    
    public var titleFont : UIFont{
        return UIFont.systemFont(ofSize: 22)
    }
    
    public var bodyFont : UIFont{
        return UIFont.systemFont(ofSize: 14)
    }
    
    public var incorrectEmailMessage : String{
        return "Email format is not correct, please try again"
    }
    
    public var instructionText : String{
        return "Please enter your Email Address"
    }
    
    public var introMessage : String{
        return "Welcome"
    }
    
    public var buttonText : String{
        return "Next"
    }
    
    
}
