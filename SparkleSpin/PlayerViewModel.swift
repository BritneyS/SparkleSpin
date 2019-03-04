//
//  PlayerViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class PlayerViewModel {
    
    private let playerModel: PlayerModel
    var nameString: String? = nil
    
    init(playerModel: PlayerModel) {
        self.playerModel = playerModel
    }
    
    func updateProperties(nameString: String) {
        playerModel.name = nameString
    }
}
