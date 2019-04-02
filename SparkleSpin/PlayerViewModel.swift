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
    var items = [PlayerViewModelItem]()
    
    override init() {
        items = nameArray.map { PlayerViewModelItem(player: $0) }
    }
}

extension PlayerViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: CellID.entryCell, for: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        entryCell.item = items[indexPath.row]
        
        if items[indexPath.row].isSaved {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        } else {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        return entryCell
    }
    
}
