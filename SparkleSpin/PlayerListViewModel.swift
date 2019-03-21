//
//  PlayerListViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

class PlayerListViewModel {
    
    private let playerListModel: PlayerListModel
    var nameString: String? = nil
    
    init(playerListModel: PlayerListModel) {
        self.playerListModel = playerListModel
    }
    
    func createPlayerWith(name: String) -> PlayerModel {
        return PlayerModel(name: name)
    }
    
    func addPlayerToPlayerList(player: PlayerModel) {
        playerListModel.playerList?.append(player)
    }
    
    func getPlayerList() -> [PlayerModel] {
        return playerListModel.playerList ?? []
    }
    
    func deletePlayer(playerToDelete: PlayerModel) {
        var playerSet = Set<PlayerModel>((playerListModel.playerList.map { $0 } ) ?? [])
        
        for player in playerSet {
            if player == playerToDelete {
                playerSet.remove(player)
            }
        }
        
        playerListModel.playerList = Array(playerSet)
    }
}
