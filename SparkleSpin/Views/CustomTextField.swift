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
        styleTextField()
        becomeFirstResponder()
    }
    
    private func styleTextField() {
        font = Font.wheelBodyFont
        tintColor = ThemeColor.Light.accentColorOne
    }
}
