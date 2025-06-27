//
//  TodoTitle.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 27/06/25.
//

import SwiftUI
import RiveRuntime

struct TodoTitle: View {
    let item: TodoModel
    
    @State var currentDragOffset: CGFloat = 0
    @StateObject var riveViewModel = RiveViewModel(fileName: "alligator_swipe")
    
    
    var body: some View {
        HStack{
            Text(item.title)
                .foregroundStyle(.white)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.2), radius: 6, x: 3, y: 3)
        .padding(.horizontal)
        .offset(x: currentDragOffset)
        .gesture(
            DragGesture()
                .onChanged{value in
                    withAnimation(.spring()){
                        currentDragOffset = value.translation.width
                    }
                }
                .onEnded{vlaue in
                    withAnimation(.spring()){
                        currentDragOffset = 0
                    }
                }
        )
    }
}

#Preview {
    TodoTitle(item: TodoModel(title: "test"))
}
