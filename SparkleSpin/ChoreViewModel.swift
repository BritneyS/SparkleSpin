//
//  ChoreViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class ChoreViewModel: NSObject {
    
    var choreList = [ChoreModel]()
    
    func saveChoreEntry(name: String) {
        let trimmedString = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let chore = ChoreModel(choreName: trimmedString)
        choreList.append(chore)
    }
}
