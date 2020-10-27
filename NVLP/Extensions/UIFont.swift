//
//  UIFont.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 23/10/2020.
//

import Foundation
import UIKit

extension UIFont{
    
    /*
    let mediumFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
    let lightFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
    let boldFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
    */
    
    class var buttonFont : UIFont{
        return UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
    }
    
    class var mainHeading : UIFont{
        return UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.bold)
    }
    
    class var subHeadingFont : UIFont{
        return UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
    }
    
}
