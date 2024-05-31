//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    var body: some View {
        Button("tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
