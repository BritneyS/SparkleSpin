//
//  EntryCell.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/17/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

enum CellState {
    case selected
    case saved
}

import UIKit

class EntryCell: UITableViewCell {

    @IBOutlet weak var entryCellLabel: CustomCellLabel!
    
    
    var item: PlayerModel? {
        didSet {
            entryCellLabel.text = item?.name
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            setCellStateWith(state: .selected)
        } else {
            setCellStateWith(state: .saved)
        }
    }
    
    func setCellStateWith(state: CellState) {
        
        switch state {
        case .saved:
            entryCellLabel.textColor = ThemeColor.Light.accentColorOne
        case .selected:
            let backgroundView = UIView()
            backgroundView.backgroundColor = ThemeColor.Light.accentColorOne
            selectedBackgroundView = backgroundView
            entryCellLabel.textColor = ThemeColor.Light.primaryColor
        }
    }
}
