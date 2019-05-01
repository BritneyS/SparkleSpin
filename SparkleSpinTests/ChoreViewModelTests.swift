//
//  ChoreViewModelTests.swift
//  SparkleSpinTests
//
//  Created by Britney Smith on 5/1/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import XCTest
@testable import SparkleSpin

class ChoreViewModelTests: XCTestCase {

    func testAddOneChoreToChoreList() {
        // given
        let choreViewModel = ChoreViewModel()
        let name = "Wash dishes"
        
        // when
        choreViewModel.saveChoreEntry(name: name)
        
        // then
        XCTAssertEqual(choreViewModel.choreList.first?.choreName, "Wash dishes")
    }
    
    func testAddAnotherChoreToChoreList() {
        // given
        let choreViewModel = ChoreViewModel()
        let nameOne = "Wash dishes"
        let nameTwo = "Do laundry"
        choreViewModel.saveChoreEntry(name: nameOne)
        
        // when
        choreViewModel.saveChoreEntry(name: nameTwo)
        
        // then
        let choreList = choreViewModel.choreList
        XCTAssertEqual(choreList.map { $0.choreName }, ["Wash dishes", "Do laundry"])
    }
    
    func testAddChoreWithLeadingAndTrailingWhiteSpace() {
        // given
        let choreViewModel = ChoreViewModel()
        let name = "   Wash dishes    "
        
        // when
        choreViewModel.saveChoreEntry(name: name)
        
        // then
        XCTAssertEqual(choreViewModel.choreList.first?.choreName, "Wash dishes")
        
    }
}
