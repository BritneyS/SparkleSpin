//
//  PlayerViewModelTests.swift
//  SparkleSpinTests
//
//  Created by Britney Smith on 2/18/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import XCTest
@testable import SparkleSpin

class ModelTests: XCTestCase {
    
    func testCreateOnePlayer() {
        // given
        let playerViewModel = PlayerViewModel()
        let name = "Kevin"

        // when
        let playerOne = playerViewModel.createPlayerWith(name: name)

        // then
        XCTAssertEqual(playerOne.name, "Kevin")
    }
    
    func testCreateTwoPlayers() {
        // given
        let playerViewModel = PlayerViewModel()
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        
        // when
        let playerOne = playerViewModel.createPlayerWith(name: nameOne)
        let playerTwo = playerViewModel.createPlayerWith(name: nameTwo)
        
        // then
        XCTAssertEqual([playerOne.name, playerTwo.name], ["Kevin", "Lisa"])
    }
    
    func testAddOnePlayerToPlayerList() {
        // given
        let playerViewModel = PlayerViewModel()
        let name = "Kevin"
        var playerOne = playerViewModel.createPlayerWith(name: name)
        
        // when
        playerViewModel.addPlayerToSavedList(player: &playerOne)
        
        // then
        XCTAssertEqual(playerViewModel.playerList.first?.name, "Kevin")
    }
    
    func testAddAnotherPlayerToPlayerList() {
        // given
        let playerViewModel = PlayerViewModel()
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        var playerOne = playerViewModel.createPlayerWith(name: nameOne)
        playerViewModel.addPlayerToSavedList(player: &playerOne)
        
        // when
        var playerTwo = playerViewModel.createPlayerWith(name: nameTwo)
        playerViewModel.addPlayerToSavedList(player: &playerTwo)
        
        // then
        let playerList = playerViewModel.playerList
        XCTAssertEqual(playerList.map { $0.name }, ["Kevin", "Lisa"])
    }
}
