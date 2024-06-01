//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text("\(item.name)")
                }
                .onDelete(perform: { indexSet in
                    removeAtOffset(at: indexSet)
                })
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let item = ExpenseItem(name: "test", type: "personal", amount: 3)
                    expenses.items.append(item)
                }
            }
        }
    }
    
    func removeAtOffset(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
