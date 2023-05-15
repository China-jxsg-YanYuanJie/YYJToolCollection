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
