//
//  CustomCellLabel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 4/4/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class CustomCellLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleLabel()
    }

    private func styleLabel() {
        font = Font.wheelBodyFont
        textColor = ThemeColor.Light.accentColorOne
    }
}
