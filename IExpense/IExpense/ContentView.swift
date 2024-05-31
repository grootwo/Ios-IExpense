//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSecondView = false
    var body: some View {
        VStack(alignment: .leading) {
            Button("show/hide the View") {
                showingSecondView.toggle()
            }
            .sheet(isPresented: $showingSecondView) {
                SecondView()
            }
        }
        .padding()
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button("dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}
