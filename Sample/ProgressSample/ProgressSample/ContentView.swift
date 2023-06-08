//
//  ContentView.swift
//  ProgressSample
//
//  Created by Alex Maggio on 08/06/2023.
//

import SwiftUI
import ProgressUpdate

struct ContentView: View {
    var body: some View {
        VStack {
            ProgressList()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
