//
//  ContentView.swift
//  IExpense
//
//  Created by Groo on 5/31/24.
//

import SwiftUI

struct User {
    var lastName = "Last"
    var firstName = "First"
}

struct ContentView: View {
    @State var user = User()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Firstname: \(user.firstName)")
            Text("Lastname: \(user.lastName)")
            TextField("first name", text: $user.firstName)
            TextField("last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
