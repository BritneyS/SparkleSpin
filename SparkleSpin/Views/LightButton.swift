//
//  LightButton.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/5/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class LightButton: UIButton {
    
    var buttonTitle: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleButton()
        buttonTitle = "Example"
    }
    
    private func styleButton() {
        self.backgroundColor = ThemeColor.Light.primaryColor
        self.layer.cornerRadius = 8
        self.layer.shadowColor = ThemeColor.Light.secondaryColor?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
}
