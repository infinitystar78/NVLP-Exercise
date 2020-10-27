//
//  CurrencyLabel.swift
//  NVLP
//
//  Created by Melvin Wijenayaka on 27/10/2020.
//

import UIKit

@IBDesignable
class CurrencyLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public override func awakeFromNib() {
         super.awakeFromNib()
         configureLabel()
     }

     public override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
         configureLabel()
     }

     func configureLabel() {
        self.attributedText = NSAttributedString(string: self.text!, attributes: [NSAttributedString.Key.font :UIFont.subHeadingFont, NSAttributedString.Key.foregroundColor : UIColor.label])
        self.textAlignment = .left
     }

}
