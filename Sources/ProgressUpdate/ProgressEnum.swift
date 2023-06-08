//
//  ProgressEnum.swift
//

import Foundation

public struct INProgressItem {
    var status: Progress
    var lastUpdate: Date = Date()
    var name: String = {
        "\(Int(arc4random()) % 1000)"
    }()
}

extension INProgressItem: CustomStringConvertible {
    public var description: String {
        return "\(status)"
    }
}

extension INProgressItem: Hashable {}

public enum Progress {
    case queued
    case paused
    case inProgress(Double)
    case finished(Bool)
    
    public var score: Int {
        switch self {
        case .queued:           return 0
        case .paused:           return 1
        case .inProgress:       return 10000
        case .finished(let r):  return r ? 30000 : 40000
        }
    }
    
    public var advance: Progress {
        switch self {
        case .queued:            return .inProgress(0)
        case .paused:            return .inProgress(0)
        case let .inProgress(n): return .inProgress(n + 1)
        case let .finished(r):   return .finished(r)
        }
    }

}

extension Progress: Equatable, Hashable {}

extension Array<INProgressItem> {
    func sorted() -> Array<INProgressItem> {
        self.sorted { pi1, pi2 in
            switch (pi1.status, pi2.status) {
            case (let .inProgress(pi1Value), let .inProgress(pi2Value)):
                return pi1Value < pi2Value
            default:
                return pi1.status.score < pi2.status.score
            }
        }
    }
}
