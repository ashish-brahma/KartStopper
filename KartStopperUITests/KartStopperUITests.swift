//
//  KartStopperUITests.swift
//  KartStopperUITests
//
//  Created by Ashish Brahma on 10/01/25.
//

import XCTest

final class KartStopperUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }

    @MainActor
    func testListNavButtonExists() throws {
        let listsNavButton = app.buttons["listsNavButton"]
        
        XCTAssertTrue(listsNavButton.exists,"Method testListNavButtonExists() expected to find a list card but could not find one.")
    }

//    @MainActor
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
