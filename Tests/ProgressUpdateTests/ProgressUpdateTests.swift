import XCTest
@testable import ProgressUpdate

final class ProgressUpdateTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ProgressUpdate().text, "Hello, World!")
        
        let progressItems: [ProgressItem] =
        [
            ProgressItem(status: .inProgress(30)),
            ProgressItem(status: .inProgress(20)),
            ProgressItem(status: .queued),
            ProgressItem(status: .queued, lastUpdate: Date(timeIntervalSinceNow: 100000)),
            ProgressItem(status: .finished(true)),
            ProgressItem(status: .finished(false)),
        ]
        
        print(progressItems.sorted())
    }
    
    
}
