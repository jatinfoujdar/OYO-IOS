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
    @StateObject var riveViewModel = RiveViewModel(fileName: "alligator_swipe", fit: .contain)
    @State var alligatorDragOffset: CGFloat = 0
    @State var endingDragOffset: CGFloat = 0
    
    let screenWidth = UIScreen.main.bounds.width
    
    
    func updateAlligator(_ value: Double){
        riveViewModel.setInput("scroll", value: value)
    }
    
    
    var body: some View {
        HStack{
            Text(item.title)
                .foregroundStyle(.white)
                .font(.headline)
            
            Spacer()
        }
        .padding(.all)
        .background(Color.blue)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.2), radius: 6, x: 3, y: 3)
        .padding(.horizontal)
        .offset(x: currentDragOffset)
        .gesture(
            DragGesture()
                .onChanged{value in
                    
                    let percentage = value.translation.width / screenWidth * 200
                    updateAlligator(percentage)
                    
                    
                    withAnimation(.spring()){
                        currentDragOffset = value.translation.width
                        alligatorDragOffset = value.translation.width * 3
                    }
                }
                .onEnded{vlaue in
                    withAnimation(.spring()){
                        currentDragOffset = 0
                        alligatorDragOffset = 0
                    }
                }
        )
        .overlay{
            riveViewModel.view()
                .scaleEffect(x: -3, y: 3)
                .frame(width: screenWidth, height: 250)
//                                .aspectRatio(contentMode: .fit)
                .offset(x: 82, y: -55)
                .offset(x: screenWidth - alligatorDragOffset)
                .allowsHitTesting(false)
            
        }

    }
}

#Preview {
    TodoTitle(item: TodoModel(title: "test"))
}
