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
            INProgressItem(status: .inProgress(30)),
            INProgressItem(status: .inProgress(20)),
            INProgressItem(status: .queued),
            INProgressItem(status: .queued, lastUpdate: Date(timeIntervalSinceNow: 100000)),
            INProgressItem(status: .finished(true)),
            INProgressItem(status: .finished(false)),
        ]
        
        print(progressItems.sorted())
    }
    
    
}
