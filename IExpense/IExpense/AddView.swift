//
//  AddView.swift
//  IExpense
//
//  Created by Groo on 6/1/24.
//

import SwiftUI

struct AddView: View {
    var expenses: Expenses
    static let currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "en_US")
            return formatter
        }()
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal", "Business"]
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                Picker("type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("amount", value: $amount, formatter: AddView.currencyFormatter)
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                Button("Save") {
                    saveItem()
                }
            }
        }
    }
    
    func saveItem() {
        let item = ExpenseItem(name: name, type: type, amount: amount)
        expenses.items.append(item)
    }
}

#Preview {
    AddView(expenses: Expenses())
}
