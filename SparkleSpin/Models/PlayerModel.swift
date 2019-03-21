//
//  PlayerModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

class PlayerModel {
    var name: String?
    var uuid: String?
    
    init(name: String?) {
        self.name = name
        self.uuid = NSUUID().uuidString
    }
}

extension PlayerModel: Equatable {
    static func == (lhs: PlayerModel, rhs: PlayerModel) -> Bool {
        return lhs.name == rhs.name && lhs.uuid == rhs.uuid
    }
}

extension PlayerModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(uuid)
    }
}

