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
        Text(habit.title)
    }
}

#Preview {
    HabitView(habit: Habit(title: "유도 업어 치기", description: "매일 상대방 아무나 10번 업어 치기"))
}
