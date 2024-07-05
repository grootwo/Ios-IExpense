//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses) { expense in
                        if expense.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .font(.headline)
                                    Text(expense.type)
                                        .font(.subheadline)
                                }
                                Spacer()
                                Text(expense.amount, format: .currency(code: expense.currencyCode))
                                    .foregroundStyle(expense.amount < 10 ? .black.opacity(0.3) : (expense.amount < 100 ? .black.opacity(0.6) : .black))
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        removeAtOffset(at: indexSet)
                    })
                }
                Section("Business") {
                    ForEach(expenses) { expense in
                        if expense.type == "Business" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .font(.headline)
                                    Text(expense.type)
                                        .font(.subheadline)
                                }
                                Spacer()
                                Text(expense.amount, format: .currency(code: expense.currencyCode))
                                    .foregroundStyle(expense.amount < 10 ? .black.opacity(0.3) : (expense.amount < 100 ? .black.opacity(0.6) : .black))
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        removeAtOffset(at: indexSet)
                    })
                    
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeAtOffset(at offset: IndexSet) {
//        var expense = expenses[offset]
//        modelContext.delete(expense)
    }
}

#Preview {
    ContentView()
}
