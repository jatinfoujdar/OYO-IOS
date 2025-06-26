//
//  TodoList.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 26/06/25.
//

import SwiftUI

struct TodoList: View {
    @State private var newItem = ""
    var body: some View {
        VStack{
            Text("Wander - List")
                .foregroundStyle(.blue)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Scale of the day")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.medium)
            
            HStack{
                TextField(" ", text: $newItem)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.headline.weight(.medium))
                    .foregroundStyle(.white)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.2)))
                Button(action: {
                    
                }){
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
    }
}

#Preview {
    TodoList()
}
