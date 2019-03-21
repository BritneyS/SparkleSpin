//
//  ChoreViewModel.swift
//  SparkleSpin
//
//  Created by Britney Smith on 2/27/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

class ChoreViewModel {
    
    private let choreModel: ChoreModel
    var choreNameString: String? = nil
    
    init(choreModel: ChoreModel) {
        self.choreModel = choreModel
    }
    
    func updateProperties(choreNameString: String) {
        choreModel.choreName = choreNameString
    }
}
