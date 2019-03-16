//
//  Identifier.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/16/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

enum Identifier {
    case homeToPlayer
    
    var segueID: String {
        switch self {
        case .homeToPlayer:
            return "homeToPlayer"
        }
    }
}
