//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text("\(item.name)")
                }
                .onDelete(perform: { indexSet in
                    removeAtOffset(at: indexSet)
                })
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddView = true
                }
            }
            .sheet(isPresented: $showingAddView, content: {
                AddView(expenses: expenses)
            })
        }
    }
    
    func removeAtOffset(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
