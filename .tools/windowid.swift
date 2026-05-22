#!/usr/bin/swift
import Foundation
import Cocoa
import CoreGraphics.CGWindow

let windows : NSArray = CGWindowListCopyWindowInfo(CGWindowListOption.excludeDesktopElements, kCGNullWindowID)! as NSArray

let search_for_app = CommandLine.arguments[1]
let search_for_win = CommandLine.arguments[2]

var matched: [(Int, String)] = []
var kittyWindows: [(Int, String)] = []

for window in windows {
    let window = window as! NSDictionary

    let app_name = window[kCGWindowOwnerName] as? String ?? ""
    let window_name = window[kCGWindowName] as? String ?? ""
    let window_num = window[kCGWindowNumber] as? Int ?? 0

    if app_name == search_for_app {
        kittyWindows.append((window_num, window_name))
        if window_name == search_for_win {
            matched.append((window_num, window_name))
        }
    }
}

if let first = matched.first {
    print(first.0)
} else {
    FileHandle.standardError.write("windowid.swift: no \(search_for_app) window title contains \"\(search_for_win)\". Visible \(search_for_app) windows:\n".data(using: .utf8)!)
    for (num, name) in kittyWindows {
        FileHandle.standardError.write("  id=\(num) title=\"\(name)\"\n".data(using: .utf8)!)
    }
    exit(1)
}
