import SwiftUI
import UIKit
public struct YYJToolCollection {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}
public struct YYJLog{
    public static func info(_ message: Any, file: String = #file, method: String = #function, line: Int = #line) {
      #if DEBUG
        print("🍺🍺🍺\n\((file as NSString).lastPathComponent)[\(line)], \(method): \n\(message)\n🍺🍺🍺\n")
      #endif
    }
}
