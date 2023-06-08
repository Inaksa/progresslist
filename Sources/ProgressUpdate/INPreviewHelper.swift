//
//  PreviewHelper.swift
//

import Foundation

extension INProgressItem {
    static func getItems(_ n: Int = 10) -> [INProgressItem] {
        let statuses: [INProgress] =
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
        
        var retValue: [INProgressItem] = []
        
        for idx in 0 ..< n {
            let item = INProgressItem(status: statuses.randomElement()!, name: "\(idx)")
            retValue.append(item)
        }
        
        return retValue
    }
    
    static func getAllKinds() -> [INProgressItem] {
        let statuses: [INProgress] =
            [
                .paused,
                .queued,
                .finished(true),
                .finished(false),
                .inProgress(20),
            ]
        
        var retValue: [INProgressItem] = []
        
        for idx in 0 ..< statuses.count {
            let item = INProgressItem(status: statuses[idx], name: "\(idx)")
            retValue.append(item)
        }
        
        return retValue
    }
}
