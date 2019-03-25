//
//  PlayerListModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/20/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

class PlayerListModel {
    var playerList: [PlayerModel]?
    
    init(playerList: [PlayerModel]?) {
        self.playerList = playerList
    }
}

extension PlayerListModel: Equatable {
    static func == (lhs: PlayerListModel, rhs: PlayerListModel) -> Bool {
        return lhs.playerList == rhs.playerList
    }
}
