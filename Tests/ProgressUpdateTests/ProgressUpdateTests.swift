import XCTest
@testable import ProgressUpdate

final class ProgressUpdateTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ProgressUpdate().text, "Hello, World!")
        
        let progressItems: [INProgressItem] =
        [
            INProgressItem(status: .inProgress(30), name: ""),
            INProgressItem(status: .inProgress(20), name: ""),
            INProgressItem(status: .queued, name: ""),
            INProgressItem(status: .finished(true), name: ""),
            INProgressItem(status: .finished(false), name: ""),
        ]
        
        print(progressItems.sorted())
    }
    
    
}
