//
//  ContentView.swift
//  ToDoApp
//
//  Created by Nikoloz Gachechiladze on 08.12.23.
//

import SwiftUI

//MARK: -  UI

struct ContentView: View {
    
    @State private var incompleteTasks = [
        Task(taskName: "Mobile App Research", taskDateString: "4 Oct"),
        Task(taskName: "Prepare Wireframe for main flow", taskDateString: "4 Oct"),
        Task(taskName: "Prepare Screens", taskDateString: "4 Oct"),
        Task(taskName: "Website Research", taskDateString: "5 Oct"),
        Task(taskName: "Convert to MVVM", taskDateString: "5 Oct"),
        Task(taskName: "Learn ObjC", taskDateString: "5 Oct")
    ]
    @State private var completedTasks: [Task] = []
    
    
    var body: some View {
        VStack (spacing: 20){
            HStack {
                Text("You have \(incompleteTasks.count) tasks to complete")
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .overlay(
                        Text(String(completedTasks.count))
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                            .padding(4)
                            .background(Color.red)
                            .cornerRadius(10)
                            .offset(x: 15, y: 15)
                    )
            }
            Button("Complete All") {
                completedTasks.append(contentsOf: incompleteTasks)
                incompleteTasks.removeAll()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.72, green: 0.52, blue: 0.87), Color.init(red: 0.87, green: 0.52, blue: 0.70)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            .foregroundColor(.white)
            .bold()
            Text("Progress")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .bold()
            VStack {
                Text("Daily Task")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .bold()
                Text("\(completedTasks.count)/6 Completed")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                ProgressView(value: calculateProgress())
            }
            .padding()
            .background(Color.init(red: 0.09, green: 0.09, blue: 0.09))
            .cornerRadius(10)
            Text("Completed Tasks")
                .frame(maxWidth: .infinity, alignment: .leading)
            List {
                ForEach(completedTasks + incompleteTasks) { task in
                    HStack {
                        VStack(spacing: 4) {
                            Text(task.taskName)
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.white)
                                Text(task.taskDateString)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        Spacer()
                        Image(systemName: taskIsCompleted(task) ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(taskIsCompleted(task) ? .green : .white)
                            .onTapGesture {
                                toggleTaskCompletion(task)
                            }
                    }
                    .background(Color.init(red: 0.12, green: 0.12, blue: 0.12))
                    .listRowBackground(Color(.init(red: 0.12, green: 0.12, blue: 0.12)))
                }
                .background(Color.init(red: 0.12, green: 0.12, blue: 0.12))
            }
            .background(Color.init(red: 0.12, green: 0.12, blue: 0.12))
            .listStyle(PlainListStyle())
            .cornerRadius(10)
        }
        .padding()
        .background(Color.init(red: 0.0007, green: 0.0007, blue: 0.02))
    }
    
    //MARK: -  Methods
    
    private func calculateProgress() -> Double {
        let totalTasks = completedTasks.count + incompleteTasks.count
        return Double(completedTasks.count) / Double(totalTasks)
    }
    
    private func taskIsCompleted(_ task: Task) -> Bool {
        return completedTasks.contains { $0.id == task.id }
    }
    
    private func toggleTaskCompletion(_ task: Task) {
        if let index = incompleteTasks.firstIndex(where: { $0.id == task.id }) {
            completedTasks.append(incompleteTasks.remove(at: index))
        } else if let index = completedTasks.firstIndex(where: { $0.id == task.id }) {
            incompleteTasks.append(completedTasks.remove(at: index))
        }
    }
}



#Preview {
    ContentView()
}
