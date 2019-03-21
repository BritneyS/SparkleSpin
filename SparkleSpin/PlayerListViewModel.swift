//
//  PlayerListViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class PlayerListViewModel {
    
    private let playerListModel: PlayerListModel
    var nameString: String? = nil
    
    init(playerListModel: PlayerListModel) {
        self.playerListModel = playerListModel
    }
    
    func createPlayersWith(names nameStrings: [String]) -> [PlayerModel] {
        for name in nameStrings {
            let playerModel = PlayerModel(name: name)
            playerListModel.playerList?.append(playerModel)
        }
        return playerListModel.playerList ?? []
    }
}
