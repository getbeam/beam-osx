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


    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        debugPrint("App has started")
        setupStatusBarApp()
        
        // let screenshot = Screenshot()
        
    }
    
    
    
    func setupStatusBarApp() {
        debugPrint("Entered setupStatusBarApp")
        statusItem.title = "S"
        statusItem.menu = statusMenu
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

