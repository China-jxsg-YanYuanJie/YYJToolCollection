import XCTest
@testable import YYJToolCollection

final class YYJToolCollectionTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(YYJToolCollection().text, "Hello, World!")
        YYJLog.info("xxxx")
    }
}
enum testImage: String, AppImageAssetProtocol {
    case ic_com_tabbar_home
    case ic_com_tabbar_product
    case ic_com_flamingo
    case ic_com_add
    func relative() -> String {
        switch self {
        case .ic_com_flamingo, .ic_com_add:
            return "Common/"
        default:
            return "TabBar/"
        }
    }

    func fullName() -> String {
        self.rawValue
    }

    func bundlePath() -> String? {
        Bundle.main.path(forResource: "ImageResource", ofType: "bundle")
    }
}
