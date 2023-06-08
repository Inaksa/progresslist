//
//  INProgressListCell.swift
//  
//
//  Created by Alex Maggio on 07/06/2023.
//

import SwiftUI

public extension INProgress {
    public var iconName: String {
        switch self {
        case .queued:
            return "tray.and.arrow.down"
        case .inProgress:
            return "stopwatch"
        case .paused:
            return "pause.circle"
        case let .finished(r):
            return r ? "externaldrive.badge.checkmark" : "externaldrive.badge.xmark"
        }
    }
    
    public var iconColor: Color {
        switch self {
        case .queued:
            return .blue
        case .inProgress:
            return .primary
        case .paused:
            return .secondary
        case let .finished(r):
            return r ? .green : .red
        }
    }

}

public struct INProgressListCell: View {
    var item: INProgressItem
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: item.status.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(item.status.iconColor)
                Text(item.name)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                switch item.status {
                case let .inProgress(progress):
                    ProgressView(value: progress / 100.0)
                        .padding(.horizontal)
                default:
                    EmptyView()
                }
            }
        }
            .padding()
            .frame(minHeight: 30)
    }
}

struct ProgressListCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            INProgressListCell(item: INProgressItem(status: .queued, name: "Queued"))
            INProgressListCell(item: INProgressItem(status: .paused, name: "Paused"))
            INProgressListCell(item: INProgressItem(status: .finished(true), name: "Finished Success"))
            INProgressListCell(item: INProgressItem(status: .finished(false), name: "Finished Failure"))
            INProgressListCell(item: INProgressItem(status: .inProgress(5), name: "In Progress 5%"))
            INProgressListCell(item: INProgressItem(status: .inProgress(90), name: "In Progress 90%"))
        }
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
