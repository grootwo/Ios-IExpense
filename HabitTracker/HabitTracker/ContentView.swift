//
//  ContentView.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    var habits = [Habit(title: "매일 낙법 연습하기", description: "매일 전방/측방/후방 낙법 최소 10번 연습하기 "), Habit(title: "낙법 연습하기", description: "전방/측방/후방 낙법 최소 10번 연습하기 ")]
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits, id: \.self) { habit in
                    NavigationLink(destination: HabitView(habit: habit), label: {
                        HStack {
                            Text(habit.title)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "\(habit.successCount).circle.fill")
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
