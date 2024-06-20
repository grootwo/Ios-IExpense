//
//  HabitView.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import SwiftUI

struct HabitView: View {
    @State var habit: Habit
    var body: some View {
        VStack {
            Spacer()
            Text(habit.description)
                .font(.title3)
            Spacer()
            Button(action: {
                habit.successCount += 1
            }, label: {
                    Label("오늘도 성공!", systemImage: "checkmark.circle")
                        .font(.title)
                        .foregroundColor(Color.random())
            })
        }
        .padding()
        .toolbar {
            Text("달성 횟수: \(habit.successCount)")
        }
    }
}

#Preview {
    HabitView(habit: Habit(title: "유도 업어 치기", description: "매일 상대방 아무나 10번 업어 치기"))
}
