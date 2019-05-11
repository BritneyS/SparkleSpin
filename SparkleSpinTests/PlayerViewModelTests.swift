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
    
    func testAddOnePlayerToPlayerList() {
        // given
        let playerViewModel = PlayerViewModel()
        let name = "Kevin"
        
        // when
        playerViewModel.savePlayerEntry(name: name)
        
        // then
        XCTAssertEqual(playerViewModel.playerList.first?.name, "Kevin")
    }
    
    func testAddAnotherPlayerToPlayerList() {
        // given
        let playerViewModel = PlayerViewModel()
        let nameOne = "Kevin"
        let nameTwo = "Lisa"
        playerViewModel.savePlayerEntry(name: nameOne)
        
        // when
        playerViewModel.savePlayerEntry(name: nameTwo)
        
        // then
        let playerList = playerViewModel.playerList
        XCTAssertEqual(playerList.map { $0.name }, ["Kevin", "Lisa"])
    }
    
    func testAddPlayerWithLeadingAndTrailingWhiteSpace() {
        // given
        let playerViewModel = PlayerViewModel()
        let name = "   Kevin Walsh    "
        
        // when
        playerViewModel.savePlayerEntry(name: name)
        
        // then
        XCTAssertEqual(playerViewModel.playerList.first?.name, "Kevin Walsh")
    }
}
