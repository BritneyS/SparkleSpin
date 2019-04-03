//
//  EntryCell.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/17/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

enum CellState {
    case entering
    case selected
}

import UIKit

class EntryCell: UITableViewCell {

    @IBOutlet weak var entryTextField: CustomTextField!
    @IBOutlet weak var underlineView: UIView!
    
    var item: PlayerModel? {
        didSet {
            entryTextField.text = item?.name
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if self.isSelected == selected { return }
        super.setSelected(selected, animated: animated)
        
        if selected {
            setCellStateWith(state: .selected)
        } else {
            setCellStateWith(state: .entering)
        }
    }
    
    private func setCellStateWith(state: CellState) {
        
        switch state {
        case .entering:
            accessoryType = .none
            entryTextField.isUserInteractionEnabled = true
            entryTextField.textColor = ThemeColor.Light.secondaryColor
            underlineView.isHidden = false
        case .selected:
            accessoryType = .checkmark
            let backgroundView = UIView()
            backgroundView.backgroundColor = ThemeColor.Light.accentColorOne
            selectedBackgroundView = backgroundView
            entryTextField.isUserInteractionEnabled = false
            entryTextField.textColor = ThemeColor.Light.primaryColor
            underlineView.isHidden = true
        }
    }
}
