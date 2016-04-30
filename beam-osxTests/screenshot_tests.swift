//
//  screenshot_tests.swift
//  beam-osx
//
//  Created by Christian Poplawski on 27/04/16.
//  Copyright © 2016 beam. All rights reserved.
//

import XCTest

class screenshot_tests: XCTestCase {
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreateTempoararyFolder() {
        let screenshot = Screenshot()
        
        let existingPath = NSBundle.mainBundle().bundlePath
        let newPath = NSBundle.mainBundle().bundlePath + "/Contents/testPath"
        
        
        XCTAssert(screenshot.createTempoararyFolder(existingPath) == false)
        XCTAssert(screenshot.createTempoararyFolder(newPath) == true)
        
        
        func removeTestingDirectory() {
            let fileManager = NSFileManager()
            do {
               try fileManager.removeItemAtPath(newPath)
            } catch {
                print(error)
            }
            
        }
        
        removeTestingDirectory()
    
    }
    
    func testTemporaryFolderExists() {
        let screenshot = Screenshot()
        
        let existingPath = NSBundle.mainBundle().bundlePath
        let newPath = NSBundle.mainBundle().bundlePath + "/Contents/testPath"
        
        XCTAssert(screenshot.temporaryFolderExists(existingPath) == true)
        XCTAssert(screenshot.temporaryFolderExists(newPath) == false)
        
        func removeTestingDirectory() {
            let fileManager = NSFileManager()
            do {
                try fileManager.removeItemAtPath(newPath)
            } catch {
                print(error)
            }
            
        }
        
        removeTestingDirectory()
        
    }

}
