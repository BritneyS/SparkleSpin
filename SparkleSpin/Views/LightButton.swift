//
//  LightButton.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/5/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

@IBDesignable
class LightButton: UIButton {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleButton()
    }
    
    private func styleButton() {
        self.backgroundColor = ThemeColor.Light.primaryColor
        self.layer.cornerRadius = 8
        self.layer.shadowColor = ThemeColor.Light.secondaryColor?.cgColor
        self.layer.shadowOffset = CGSize(width: 1.5, height: 2.0)
        self.layer.shadowOpacity = 0.9
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
    }
}
