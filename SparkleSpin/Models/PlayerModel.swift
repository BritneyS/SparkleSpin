//
//  PlayerModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class PlayerModel: NSObject {
    var name: String?
    var isSelected = false
    
    init(name: String?) {
        self.name = name
    }
}

