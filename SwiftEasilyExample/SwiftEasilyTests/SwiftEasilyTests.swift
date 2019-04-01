//
//  SwiftEasilyTests.swift
//  SwiftEasilyTests
//
//  Created by lxb on 2019/3/25.
//  Copyright © 2019 lxb. All rights reserved.
//

import XCTest
@testable import SwiftEasily

class SwiftEasilyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        let color = try? UIColor(rgba: "#6a6a77")
        XCTAssertNotNil(color)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
