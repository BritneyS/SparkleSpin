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
        delegate = self
    }
    
    private func styleTextField() {
        backgroundColor = .white
        placeholder = "Enter here"
        borderStyle = .none
        font = Font.wheelBodyFont
        tintColor = ThemeColor.Light.accentColorOne
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characterLimit = 21
        guard let text = text else { return false }
        let currentTextString = text as NSString
        let newTextString = currentTextString.replacingCharacters(in: range, with: string) as NSString
        return newTextString.length <= characterLimit
    }
    
}
