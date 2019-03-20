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
    private let playerListModel: PlayerListModel
    var nameString: String? = nil
    
    init(playerModel: PlayerModel, playerListModel: PlayerListModel) {
        self.playerModel = playerModel
        self.playerListModel = playerListModel
    }
    
    func updateProperties(nameString: String) {
        playerModel.name = nameString
    }
    
    func addPlayerToPlayerList(player: PlayerModel) {
        playerListModel.playerList?.append(player)
    }
}
