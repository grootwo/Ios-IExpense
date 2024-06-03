//
//  AddView.swift
//  IExpense
//
//  Created by Groo on 6/1/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var expenses: Expenses
    @State var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    @State private var currencyLocale = "USD"
    let currencyLocales = ["USD", "EUR", "KRW"]
    @State private var name = ""
    @State private var amount = 0.0
    @State private var type = "Personal"
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
                Picker("currency", selection: $currencyLocale) {
                    ForEach(currencyLocales, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: currencyLocale) { oldValue, newValue in
                    if newValue == "USD" {
                        currencyFormatter.locale = Locale(identifier: "en_US")
                    } else if newValue == "EUR" {
                        currencyFormatter.locale = Locale(identifier: "fr_FR")
                    } else {
                        currencyFormatter.locale = Locale(identifier: "ko_KR")
                    }
                }
                TextField("amount", value: $amount, formatter: currencyFormatter)
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currencyCode: currencyLocale)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
