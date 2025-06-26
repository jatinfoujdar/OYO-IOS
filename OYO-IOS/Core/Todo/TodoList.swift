//
//  TodoList.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 26/06/25.
//

import SwiftUI

struct TodoList: View {
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
        }
        .padding()
        .background(.black)
        .cornerRadius(16)
    }
}

#Preview {
    TodoList()
}
