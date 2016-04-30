//
//  Screenshot.swift
//  beam-osx
//
//  Created by Christian Poplawski on 27/04/16.
//  Copyright © 2016 beam. All rights reserved.
//

import Foundation

class Screenshot {
    
    /// Path of the temporary folder to save screenshots in
    let temporaryFolderPath = NSBundle.mainBundle().bundlePath + "/Contents/tmp"
    
    
    init() {
        debugPrint("Screenshot Initialized!")
        captureScreenshot()
    }
    
    
    // MARK: Capture Screenshot
    
    
    /**
        Captures a screenshot using the screencapture unix command and saves it to the Desktop
        
        - Important: This Function is not finished and may change drastically in the future
        
        - Returns: Always 0, for some reason
     */
    func captureScreenshot() -> NSNumber {
        
        /// Set the task
        let screenshotTask = NSTask()
        screenshotTask.launchPath = "/usr/sbin/screencapture"
        screenshotTask.arguments = ["-i", temporaryFolderPath + "/screenshot.png"]
        screenshotTask.launch()
        screenshotTask.waitUntilExit()
        
        /// Debug
        debugPrint("Screenshot saved to " + temporaryFolderPath);
        debugPrint("This should not be printed until the screenshot task has finished.")
        
        createTempoararyFolder(temporaryFolderPath)
        
        // TODO: Fix return Type
        return 0
    }
    
    
    // MARK: Helpers 
    
    /**
        Creates a folder at a desired path.
     
        - Note: The functions name is somewhat misleading since it will create a folder of any name at any given path.
        The name is kept because it's only objective is to creat the tmp folder for us.
     
        - Parameter path: The desired path of the directory
     
        - Returns: true if a folder was created, false otherwise
     */
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
    
    /**
        Checks if a directory exists at the given path.
        
        - Parameter path: The path to be checked
     
        - Returns: true, if a directroy at the given path exists
     
    */
    func temporaryFolderExists(path:String) -> Bool {
        let fileManager = NSFileManager()
        return fileManager.fileExistsAtPath(path)
    }
    
}
