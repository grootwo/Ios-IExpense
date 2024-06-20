//
//  AddView.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import SwiftUI

struct AddView: View {
    @State var title = ""
    @State var description = ""
    var body: some View {
        Form {
            Section("Title") {
                TextField("Input the habit's title", text: $title)
            }
            Section("Description") {
                TextField("Describe about the habit", text: $description)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    AddView()
}
