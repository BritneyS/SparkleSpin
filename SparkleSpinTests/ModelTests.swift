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
    
    func testCreateOnePlayer() {
        // given
        let name = "Kevin"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)

        // when
        let playerOne = playerListViewModel.createPlayerWith(name: name)

        // then
        XCTAssertEqual(playerOne.name, "Kevin")
    }
    
    func testCreateTwoPlayers() {
        // given
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)
        
        // when
        let playerOne = playerListViewModel.createPlayerWith(name: nameOne)
        let playerTwo = playerListViewModel.createPlayerWith(name: nameTwo)
        
        // then
        XCTAssertEqual([playerOne.name, playerTwo.name], ["Kevin", "Lisa"])
    }
    
    func testAddOnePlayerToPlayerList() {
        // given
        let name = "Kevin"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)
        let playerOne = playerListViewModel.createPlayerWith(name: name)
        
        // when
        playerListViewModel.addPlayerToPlayerList(player: playerOne)
        
        // then
        XCTAssertEqual(playerListModel.playerList?.first?.name, "Kevin")
    }
    
    func testAddAnotherPlayerToPlayerList() {
        // given
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)
        
        let playerOne = playerListViewModel.createPlayerWith(name: nameOne)
        playerListViewModel.addPlayerToPlayerList(player: playerOne)
        
        // when
        let playerTwo = playerListViewModel.createPlayerWith(name: nameTwo)
        playerListViewModel.addPlayerToPlayerList(player: playerTwo)
        
        // then
        guard let playerList = playerListModel.playerList else { return }
        XCTAssertEqual(playerList.map { $0.name }, ["Kevin", "Lisa"])
        
    }
    
    func testGetPlayerList() {
        // given
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)
        
        let playerOne = playerListViewModel.createPlayerWith(name: nameOne)
        playerListViewModel.addPlayerToPlayerList(player: playerOne)
        
        let playerTwo = playerListViewModel.createPlayerWith(name: nameTwo)
        playerListViewModel.addPlayerToPlayerList(player: playerTwo)
        
        // when
        let totalPlayerList = playerListViewModel.getPlayerList()
        
        // then
        XCTAssertEqual(totalPlayerList.map { $0.name }, ["Kevin", "Lisa"])
    }
    
    func testDeletePlayer() {
        // given
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)
        
        let playerOne = playerListViewModel.createPlayerWith(name: nameOne)
        playerListViewModel.addPlayerToPlayerList(player: playerOne)
        
        let playerTwo = playerListViewModel.createPlayerWith(name: nameTwo)
        playerListViewModel.addPlayerToPlayerList(player: playerTwo)
        
        // when
        playerListViewModel.deletePlayer(playerToDelete: playerOne)
        
        // then
        XCTAssertEqual(playerListModel.playerList?[0].name, "Lisa")
    }
    
    func testDeletePlayerWithSameName() {
        // given
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        let nameThree = "Kevin"
        
        let playerListModel = PlayerListModel(playerList: [])
        let playerListViewModel = PlayerListViewModel(playerListModel: playerListModel)
        
        let playerOne = playerListViewModel.createPlayerWith(name: nameOne)
        playerListViewModel.addPlayerToPlayerList(player: playerOne)
        
        let playerTwo = playerListViewModel.createPlayerWith(name: nameTwo)
        playerListViewModel.addPlayerToPlayerList(player: playerTwo)
        
        let playerThree = playerListViewModel.createPlayerWith(name: nameThree)
        playerListViewModel.addPlayerToPlayerList(player: playerThree)
        
        // when
        playerListViewModel.deletePlayer(playerToDelete: playerThree)
        
        // then
        guard let playerArray = playerListModel.playerList else { return }
        XCTAssertEqual(playerArray.map { $0.name }, ["Kevin", "Lisa"])
    }
}
