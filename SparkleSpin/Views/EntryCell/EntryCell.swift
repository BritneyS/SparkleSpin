//
//  EntryCell.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/17/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//


import UIKit

class EntryCell: UITableViewCell {

    @IBOutlet weak var entryCellLabel: CustomCellLabel!
    
    
    var item: PlayerModel? {
        didSet {
            entryCellLabel.text = item?.name
        }
    }
}
