//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var number = 0
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("number \($0)")
                    }
                    .onDelete(perform: { indexSet in
                        removeElement(at: indexSet)
                    })
                }
                Button("Add number") {
                    numbers.append(number)
                    number += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    func removeElement(at offset: IndexSet) {
        numbers.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
