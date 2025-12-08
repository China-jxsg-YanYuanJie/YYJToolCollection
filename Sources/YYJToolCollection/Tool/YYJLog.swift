//
//  YYJLog.swift
//  YYJToolCollection
//
//  Created by ajay on 2025/12/8.
//


import SnapKit
import SwiftUI
import UIKit

public struct YYJLog{
    public static func info(_ message: Any, file: String = #file, method: String = #function, line: Int = #line) {
        NSLog("🕰[\(Date())][\((file as NSString).lastPathComponent)[\(line)]-\(method)]: \(message)")
    }
}
