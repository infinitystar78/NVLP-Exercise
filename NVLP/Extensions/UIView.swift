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
 
}
