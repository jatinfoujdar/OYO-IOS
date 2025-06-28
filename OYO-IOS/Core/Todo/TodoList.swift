//
//  TodoList.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 26/06/25.
//

import SwiftUI

struct TodoList: View {
    @State private var newItemTitle = ""
    @State private var todoItems: [TodoModel] = [
           TodoModel(title: "Buy groceries"),
           TodoModel(title: "Finish SwiftUI project"),
           TodoModel(title: "Call mom")
    ]
    
        var body: some View {
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    Text("Wander - List")
                        .foregroundStyle(.blue)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Scale of the day")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.medium)

                    HStack {
                        TextField("Add a task...", text: $newItemTitle, onCommit: addItem)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.headline.weight(.medium))
                            .foregroundStyle(.white)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.2)))

                        Button(action: addItem) {
                            Text("Add")
                                .foregroundStyle(.white)
                                .font(.headline.bold())
                                .padding(.trailing)
                        }
                    }
                }
                .padding()
                .background(.black)
                .cornerRadius(16)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(todoItems) { todoItem in
                            TodoTitle(item: todoItem, onComplete: { item in deleteItem(item: todoItem) })
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }

    
    func addItem(){
        if !newItemTitle.isEmpty{
            let newItem = TodoModel(title: newItemTitle)
            todoItems.append(newItem)
            newItemTitle = ""
        }
    }
    
    func deleteItem(item: TodoModel) {
        if let index = todoItems.firstIndex(where: { $0.id == item.id }) {
            todoItems.remove(at: index)
        }
    }

    
}

#Preview {
    TodoList()
}
