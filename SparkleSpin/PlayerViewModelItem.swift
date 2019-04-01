//
//  PlayerViewModelItem.swift
//  SparkleSpin
//
//  Created by Britney Smith on 4/1/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

class PlayerViewModelItem {
    private var player: PlayerModel
    var isSaved = false
    var name: String {
        return player.name ?? ""
    }
    
    init(player: PlayerModel) {
        self.player = player
    }
}
