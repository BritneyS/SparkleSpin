//
//  ChoreModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class ChoreModel: NSObject {
    var choreName: String?
    var isSelected = false
    
    init(choreName: String?) {
        self.choreName = choreName
    }
}
