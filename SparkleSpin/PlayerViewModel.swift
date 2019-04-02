//
//  PlayerViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 4/1/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

let nameArray = [PlayerModel(name: "Nicole"),
                PlayerModel(name: "Jackson"),
                PlayerModel(name: "Reese"),
                PlayerModel(name: "Christina")]

class PlayerViewModel {
    var items = [PlayerViewModelItem]()
    
    init() {
        items = nameArray.map { PlayerViewModelItem(player: $0) }
    }
}
