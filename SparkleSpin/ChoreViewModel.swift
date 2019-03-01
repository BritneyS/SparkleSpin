//
//  ChoreViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Foundation

class ChoreViewModel {
    
    private let choreModel: ChoreModel
    var choreNameString: String? = nil
    
    init(choreModel: ChoreModel) {
        self.choreModel = choreModel
    }
    
    func updateProperties(choreModel: ChoreModel, choreNameString: String) {
        setPlayerName(choreModel: choreModel, choreNameString: choreNameString)
    }
    
    private func setPlayerName(choreModel: ChoreModel, choreNameString: String?) {
        choreModel.choreName = choreNameString
    }
}
