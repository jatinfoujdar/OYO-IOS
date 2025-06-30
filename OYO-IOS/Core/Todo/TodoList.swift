//
//  TodoList.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 26/06/25.
//
import RiveRuntime
import SwiftUI



struct TodoList: View {
    
    let button = RiveViewModel(fileName: "button")
    
    @State private var newItemTitle = ""
    @State private var todoItems: [TodoModel] = [
           TodoModel(title: "Watch yachts at Port Hercule"),
           TodoModel(title: "Explore hidden alleys in Old Town"),
           TodoModel(title: "Walk the Formula 1 Grand Prix route"),
           TodoModel(title: "Stroll through the Japanese Garden")
    ]
    
        var body: some View {
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    Text("Wander - List")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Scale of the day")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.medium)

                    VStack {
                        TextField("Add a task...", text: $newItemTitle, onCommit: addItem)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.headline.weight(.medium))
                            .foregroundStyle(.white)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.4)))

//                        Button(action: addItem) {
//                            Text("Add")
//                                .foregroundStyle(.white)
//                                .font(.headline.bold())
//                                .padding(.trailing)
//                        }
                        button.view()
                                       .frame(width: 236, height: 64)
                                       .overlay(
                                           Text("Add task")
                                               .offset(x: 4, y: 4)
                                               .font(.headline)
                                       )
                                       .background(
                                           Color.black
                                               .cornerRadius(30)
                                               .blur(radius: 10)
                                               .opacity(0.3)
                                               .offset(y: 10)
                                       )
                                       .onTapGesture {
                                           button.play(animationName: "active")
                                           addItem()
                                       }

                    }
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: "#355C7D"), Color(hex: "#6C5B7B"), Color(hex: "#C06C84")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )

                .cornerRadius(16)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(todoItems) { todoItem in
                            TodoTitle(item: todoItem, onComplete: { item in deleteItem(item: todoItem) })
                        }
                    }
                }
                .scrollClipDisabled()

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
