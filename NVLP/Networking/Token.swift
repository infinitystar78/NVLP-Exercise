//
//  Token.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 18/10/2020.
//

import Foundation
import SwiftKeychainWrapper

struct Token{
    
    static let token = "TOKEN"
    
    static func saveToken (accessToken:String)->Bool{
        let saveSuccessful : Bool = KeychainWrapper.standard.set(accessToken, forKey:token )
        return saveSuccessful
    }
    
    static func retrieveToken()->String{
        let retrievedString: String? = KeychainWrapper.standard.string(forKey: token)
        if let _retrievedString = retrievedString{
            return _retrievedString
        }else {
            return ""
        }
     
    }
   
    static func removeToken()->Bool{
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: token)
        return removeSuccessful
    }
    
    
    
}
