//
//  INProgressListCell.swift
//  
//
//  Created by Alex Maggio on 07/06/2023.
//

import SwiftUI

extension INProgress {
    var iconName: String {
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
    
    var iconColor: Color {
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

struct INProgressListCell: View {
    var item: INProgressItem
    
    var body: some View {
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
//            .listRowSeparator(.hidden)
    }
}
struct ProgressListCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            INProgressListCell(item: INProgressItem(status: .queued))
            INProgressListCell(item: INProgressItem(status: .paused))
            INProgressListCell(item: INProgressItem(status: .finished(true)))
            INProgressListCell(item: INProgressItem(status: .finished(false)))
            INProgressListCell(item: INProgressItem(status: .inProgress(5)))
            INProgressListCell(item: INProgressItem(status: .inProgress(90)))
        }
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
