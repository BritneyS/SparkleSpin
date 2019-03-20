//
//  PlayerViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class PlayerViewModel {
    
    private let playerModels: [PlayerModel]
    private let playerListModel: PlayerListModel
    var nameString: String? = nil
    
    init(playerModels: [PlayerModel], playerListModel: PlayerListModel) {
        self.playerModels = playerModels
        self.playerListModel = playerListModel
    }
    
    func updateProperties(nameString: String) {
        for playerModel in playerModels {
            playerModel.name = nameString
        }
    }
    
    func addPlayerToPlayerList(player: PlayerModel) {
        playerListModel.playerList?.append(player)
    }
}
