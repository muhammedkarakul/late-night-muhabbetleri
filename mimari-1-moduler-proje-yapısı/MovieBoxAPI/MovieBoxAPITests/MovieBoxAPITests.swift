//
//  MovieBoxAPITests.swift
//  MovieBoxAPITests
//
//  Created by Muhammed Karakul on 26.06.2022.
//

import XCTest
import MovieBoxAPI

class MovieBoxAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTestRun() {
        MovieBoxAPIClient.testRun()
    }
}
