//
//  ViewController.swift
//  UeShita
//
//  Created by 村上晋太郎 on 2018/01/29.
//  Copyright © 2018年 村上晋太郎. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TakeScreensShots(folderName: "/Users/smurakami/Desktop")
        imageView.rotate(byDegrees: 180)
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func TakeScreensShots(folderName: String) {
        var displayCount: UInt32 = 0;
        var result = CGGetActiveDisplayList(0, nil, &displayCount)
        if (result != CGError.success) {
            print("error: \(result)")
            return
        }
        let allocated = Int(displayCount)
        let activeDisplays = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: allocated)
        result = CGGetActiveDisplayList(displayCount, activeDisplays, &displayCount)
        
        if (result != CGError.success) {
            print("error: \(result)")
            return
        }
        
        for i in 0..<displayCount {
            let screenShot: CGImage = CGDisplayCreateImage(activeDisplays[Int(i)])!
            imageView.image = NSImage(cgImage: screenShot, size: CGSize(width: screenShot.width/2, height: screenShot.height/2))
        }
    }

    func CreateTimeStamp() -> Int32 {
        return Int32(Date().timeIntervalSince1970)
    }
}

