//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "tapCount")
    var body: some View {
        Button("tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "tapCount")
        }
    }
}

#Preview {
    ContentView()
}
