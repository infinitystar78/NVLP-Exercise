//
//  String.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 17/10/2020.
//

import Foundation


extension String{
    
    func validateEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)

    }
    
}
