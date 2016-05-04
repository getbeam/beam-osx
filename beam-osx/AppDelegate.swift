//
//  AppDelegate.swift
//  beam-osx
//
//  Created by Christian Poplawski on 27/04/16.
//  Copyright © 2016 beam. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // Init StatusBarItem
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)

    @IBOutlet weak var statusMenu: NSMenu!
    
    
    /**
        Initialises a Screenshot Object when the Screenshot Button in the StatusBar Menu is pressed
        and thus starts the process to capture a screenshot.
    */
    @IBAction func takeScreenshotClicked(sender: NSMenuItem) {
        let screenshot = Screenshot()
    }
    
    
    /**
        Terminates the Application when the Quit Menu Item is clicked.
    */
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        debugPrint("App has started")
        setupStatusBarApp()
    }
    
    
    /**
        Sets the status bar icon up.
     */
    func setupStatusBarApp() {
        statusItem.title = "S"
        statusItem.menu = statusMenu
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

