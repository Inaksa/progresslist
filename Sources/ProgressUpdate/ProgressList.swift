//
//  ProgressList.swift
//  
//
//  Created by Alex Maggio on 07/06/2023.
//

import SwiftUI

public struct ProgressList: View {
    @State var items: [ProgressItem] = []
    
    @State var isAdvancing: Bool = false
    
    var showDetail: Bool = true
    
    private func getAllItems(in status: Progress) -> [ProgressItem] {
        let scoreSection = status.score
        var retValue: [ProgressItem] = []
        
        for item in items where scoreSection == item.status.score {
            retValue.append(item)
        }
        
        return retValue
    }

    private func getFinishedItems() -> [ProgressItem] {
        var retValue: [ProgressItem] = []
        
        for item in items {
            switch item.status {
            case .finished:
                retValue.append(item)
            default:
                break
            }
        }
        
        return retValue
    }

    private func getInProgressItems() -> [ProgressItem] {
        var retValue: [ProgressItem] = []
        
        for item in items {
            switch item.status {
            case .inProgress:
                retValue.append(item)
            default:
                break
            }
        }
        
        return retValue
    }

    public var body: some View {
        List {
            Section("In Progress") {
                ForEach(getInProgressItems(), id:\.self) { item in
                    ProgressListCell(item: item)
                }
            }
            
            Section("Pending") {
                ForEach(getAllItems(in: .queued), id:\.self) { item in
                    ProgressListCell(item: item)
                }
            }
            
            Section("Paused") {
                ForEach(getAllItems(in: .paused), id:\.self) { item in
                    ProgressListCell(item: item)
                }
            }
            
            Section("Completed") {
                ForEach(getFinishedItems(), id:\.self) { item in
                    ProgressListCell(item: item)
                }
            }
        }
            .listStyle(.grouped)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAdvancing.toggle()
                    } label: {
                        Text("Start Processing")
                    }
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if isAdvancing {
                        items.forEach { $0.status.advance }
                    }
                }
            }
    }
}

struct ProgressList_Previews: PreviewProvider {
    static var previews: some View {
        ProgressList(items: ProgressItem.getAllKinds())
    }
}
