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
import Foundation
import UIKit
class PlayerViewModel: NSObject {
    var player: PlayerModel?
    //var isSaved = false
    var name: String {
        return player?.name ?? ""
    }
    
    
    //var playerViewModelItem: PlayerViewModelItem? // = PlayerViewModelItem(player: nil, name: nil)
    //var items = [PlayerViewModelItem]()
    var items = [PlayerModel]()
//    var savedItems: [PlayerViewModelItem] {
//        return items.filter { return $0.isSaved }
//    }
    var selectedItems: [PlayerModel] {
        return items.filter { return $0.isSelected }
    }
    
//   init(playerModelItem: PlayerViewModelItem?) {
//        self.playerViewModelItem = playerModelItem
//    }
    
//    func getUserEntryInPlayerViewModelItem(entry: String) {
//        return playerViewModelItem.
//    }
    
//    override init() {
//        items = nameArray.map { PlayerViewModelItem(player: $0) }
//    }
    var savedItems = [PlayerModel]()
    override init() {
        items = nameArray.map { $0 }
    }
    
    func createPlayerWith(name: String) -> PlayerModel {
        return PlayerModel(name: name)
    }
    
    func addPlayerToSavedList(player: inout PlayerModel) {
        player.isSaved = true
        savedItems.append(player)
    }
}

extension PlayerViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: CellID.entryCell, for: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        entryCell.item = items[indexPath.row]
        
        if items[indexPath.row].isSelected {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            // test: selected items saved on cell redraw
            print(selectedItems.map { $0.name })
        } else {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        return entryCell
    }
    
}
