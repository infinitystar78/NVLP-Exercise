//
//  UIView.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 23/10/2020.
//

import Foundation
import UIKit

extension  UIView{
    
    func makeCircular(){   // returns circular view
        let cntr:CGPoint = self.center
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.center = cntr
        self.layer.masksToBounds = true
    }
 
    func addShadowToViewWithCornerRadius() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.07
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
       
    }
}
