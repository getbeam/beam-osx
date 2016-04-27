//
//  Screenshot.swift
//  beam-osx
//
//  Created by Christian Poplawski on 27/04/16.
//  Copyright © 2016 beam. All rights reserved.
//

import Foundation

class Screenshot {
    
    let temporaryFolderPath = NSBundle.mainBundle().bundlePath + "/Contents/tmp"
    
    init() {
        debugPrint("Screenshot Initialized!")
        captureScreenshot()
    }
    
    /// Takes a screenhot using the screencapture command
    func captureScreenshot() -> NSNumber {
        
        /// Set the task
        let screenshotTask = NSTask()
        screenshotTask.launchPath = "/usr/sbin/screencapture"
        screenshotTask.arguments = ["-i", "/Users/Cheese/Desktop/BeamScreenshot.png"]
        screenshotTask.launch()
        screenshotTask.waitUntilExit()
        
        /// Debug
        debugPrint("This should not be rpinted until the screenshot task has finished.")
        
        createTempoararyFolder(temporaryFolderPath)
        
        
        return 0
    }
    
    
    func createTempoararyFolder(path:String) -> Bool {
        // Creates /tmp in bundle if it doesn't yet exist
        // Should be handled elsewhere
        let fileManager = NSFileManager()
        if(!fileManager.fileExistsAtPath(path)) {
            do {
                try fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
                return true
            } catch {
                print(error)
                return false
            }
        }
        
        return false
    }
}
