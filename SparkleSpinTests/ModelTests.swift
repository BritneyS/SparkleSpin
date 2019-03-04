//
//  SparkleSpinTests.swift
//  SparkleSpinTests
//
//  Created by Britney Smith on 2/18/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import XCTest
@testable import SparkleSpin

class ModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreatePlayer() {
        // given
        let name = "Kevin"
        let playerOneModel = PlayerModel(name: nil)
        let playerOneViewModel = PlayerViewModel(playerModel: playerOneModel)
        
        // when
        playerOneViewModel.updateProperties(nameString: name)
        
        // then
        XCTAssertEqual(playerOneModel.name, "Kevin")
    }
    
    func testCreateChore() {
        // given
        let choreName = "Washing dishes"
        let choreOneModel = ChoreModel(choreName: nil)
        let choreOneViewModel = ChoreViewModel(choreModel: choreOneModel)
        
        // when
        choreOneViewModel.updateProperties(choreModel: choreOneModel, choreNameString: choreName)
        
        // then
        XCTAssertEqual(choreOneModel.choreName, "Washing dishes")
    }
}
