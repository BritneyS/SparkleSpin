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
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                isHighlighted = false
                self.setTitleColor(ThemeColor.Light.accentColorTwo, for: .normal)
            } else {
                self.setTitleColor(ThemeColor.Light.secondaryColor, for: .normal)
            }
            
        }
    }
    
    
    private func styleButton() {
        
        backgroundColor = ThemeColor.Light.primaryColor
        layer.cornerRadius = 8
        layer.shadowColor = ThemeColor.Light.secondaryColor?.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 2.0)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 2.0
        layer.masksToBounds = false
        
        
    }
    
    func animateButton() {

        let animation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = 2.0
        animation.toValue = 0.5
        animation.duration = 0.15
        
        
        let shadowAnimation = CABasicAnimation(keyPath: "shadowOffSet")
        shadowAnimation.fromValue = CGSize(width: 1.5, height: 2.0)
        shadowAnimation.toValue = CGSize(width: 0.0, height: 0.0)
        shadowAnimation.duration = 0.15
        
        let opacityAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        opacityAnimation.fromValue = 0.9
        opacityAnimation.toValue = 0.0
        opacityAnimation.duration = 0.15
        
        layer.add(opacityAnimation, forKey: "shadowOpacity")
        layer.add(animation, forKey: "shadowRadius")
        layer.add(shadowAnimation, forKey: "shadowOffSet")
    }
}
