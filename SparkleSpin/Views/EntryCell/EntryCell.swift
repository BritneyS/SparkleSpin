//
//  EntryCell.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/17/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

enum CellState {
    case entering
    case saved
    case selected
}

class EntryCell: UITableViewCell {

    @IBOutlet weak var entryTextField: CustomTextField!
    @IBOutlet weak var underlineView: UIView!
    
    func setCellStateTo(cellState: CellState) {
        switch cellState {
        case .entering:
            entryTextField.isUserInteractionEnabled = true
            entryTextField.textColor = ThemeColor.Light.secondaryColor
            underlineView.isHidden = false
        case .saved:
            entryTextField.isUserInteractionEnabled = false
            entryTextField.textColor = ThemeColor.Light.accentColorOne
            underlineView.isHidden = true
        case .selected:
            entryTextField.isUserInteractionEnabled = false
            entryTextField.textColor = ThemeColor.Light.primaryColor
            self.contentView.backgroundColor = ThemeColor.Light.accentColorOne
            underlineView.isHidden = true
        }
    }
}
