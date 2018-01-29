//
//  WindowController.swift
//  UeShita
//
//  Created by 村上晋太郎 on 2018/01/29.
//  Copyright © 2018年 村上晋太郎. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    override func windowDidLoad() {
        super.windowDidLoad()
        self.window?.delegate = self
    }
}

extension WindowController: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        NSApplication.shared.terminate(NSApp.keyWindow!)
    }
}
