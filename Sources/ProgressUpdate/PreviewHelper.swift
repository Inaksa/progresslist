//
//  PreviewHelper.swift
//

import Foundation

extension ProgressItem {
    static func getItems(_ n: Int = 10) -> [ProgressItem] {
        let statuses: [Progress] =
            [
                .paused,
                .queued,
                .paused,
                .queued,
                .finished(true),
                .finished(false),
                .inProgress(Double(Int(arc4random()) % 100)),
                .inProgress(Double(Int(arc4random()) % 100)),
            ]
        
        var retValue: [ProgressItem] = []
        
        for idx in 0 ..< n {
            let item = ProgressItem(status: statuses.randomElement()!, name: "\(idx)")
            retValue.append(item)
        }
        
        return retValue
    }
    
    static func getAllKinds() -> [ProgressItem] {
        let statuses: [Progress] =
            [
                .paused,
                .queued,
                .finished(true),
                .finished(false),
                .inProgress(20),
            ]
        
        var retValue: [ProgressItem] = []
        
        for idx in 0 ..< statuses.count {
            let item = ProgressItem(status: statuses[idx], name: "\(idx)")
            retValue.append(item)
        }
        
        return retValue
    }
}
