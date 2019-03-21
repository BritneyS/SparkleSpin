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
    
//    func testCreatePlayer() {
//        // given
//        let name = "Kevin"
//        let playerOneModel = PlayerModel(name: nil)
//        let playerListModel = PlayerListModel(playerList: [])
//        let playerOneViewModel = PlayerViewModel(playerModels: [playerOneModel], playerListModel: playerListModel)
//
//        // when
//        playerOneViewModel.updateProperties(nameString: name)
//
//        // then
//        XCTAssertEqual(playerOneModel.name, "Kevin")
//    }
//
//    func testCreateChore() {
//        // given
//        let choreName = "Washing dishes"
//        let choreOneModel = ChoreModel(choreName: nil)
//        let choreOneViewModel = ChoreViewModel(choreModel: choreOneModel)
//
//        // when
//        choreOneViewModel.updateProperties(choreNameString: choreName)
//
//        // then
//        XCTAssertEqual(choreOneModel.choreName, "Washing dishes")
//    }
//
//    func testAddPlayerToPlayerList() {
//        // given
//        let name = "Kevin"
//        let playerOneModel = PlayerModel(name: nil)
//        let playerListModel = PlayerListModel(playerList: [])
//        let playerOneViewModel = PlayerViewModel(playerModels: [playerOneModel], playerListModel: playerListModel
//        )
//
//        playerOneViewModel.updateProperties(nameString: name)
//
//        // when
//        playerOneViewModel.addPlayerToPlayerList(player: playerOneModel)
//
//        // then
//        XCTAssertEqual(playerListModel.playerList, [PlayerModel(name: "Kevin")])
//    }
    
    func testAddTwoPlayersToPlayerList() {
        // given
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        let nameList = [nameOne, nameTwo]
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel
        )
        
        // when
        let _ = playerListViewModel.createPlayersWith(names: nameList)
        
        // then
        XCTAssertEqual(playerListModel.playerList, [PlayerModel(name: "Kevin"), PlayerModel(name: "Lisa")])
        
    }
}
