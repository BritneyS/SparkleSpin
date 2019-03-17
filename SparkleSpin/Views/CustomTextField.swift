//
//  CustomTextField.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/17/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        underline()
    }
    
    private func underline() {
        let border = CALayer()
        let width = CGFloat(1.25)
        let customBorderColor = ThemeColor.Light.accentColorOne
        
        border.borderColor = customBorderColor?.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
