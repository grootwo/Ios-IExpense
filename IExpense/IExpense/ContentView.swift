//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    var user = User(firstName: "Hallo", lastName: "World")
    var body: some View {
        Button("Save user data") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.setValue(data, forKey: "userData")
                print("Saved user data")
            }
        }
    }
}

#Preview {
    ContentView()
}
