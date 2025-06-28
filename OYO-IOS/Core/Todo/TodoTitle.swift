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
       let onComplete: (_ item: TodoModel) -> Void
       
       @State var currentDragOffsetX: CGFloat = 0
       @State var alligatorDragOffsetX: CGFloat = 0
       @State var endingDragOffsetX: CGFloat = 0
       @State var isCompleted = false;
       
       let screenWidth = UIScreen.main.bounds.width;
       
       
       @StateObject var viewModel = RiveViewModel(fileName: "alligator_swipe", fit: .fitWidth)
       
       let maxDrag = 200.0
       
       let multiplier = 1.9
    
       
       func updateAlligator(_ value: Double) {
           viewModel.setInput("scroll", value: value)
       }
       
       func complete() {
           isCompleted = true;
           updateAlligator(100)
           withAnimation(.spring().delay(1)) {
               alligatorDragOffsetX = 0
           } completion: {
               onComplete(item)
           }
       }
       
       var body: some View {
           HStack {
               Text(item.title)
                   .foregroundColor(.white)
                   .font(.headline)
               Spacer()
           }
           .padding(.all)
           .background(Color(.blue))
           .cornerRadius(16)
           .shadow(color: .black.opacity(0.2), radius: 6, x: 3, y: 3)
           
           .padding(.horizontal)
           .offset(x: currentDragOffsetX)
           .offset(x: endingDragOffsetX)
           .gesture(
               DragGesture()
                   .onChanged { value in
                       if (isCompleted || value.translation.width < -30) {
                           return
                       }
                       
                       let percentage = value.translation.width / screenWidth * (100 * multiplier) ;
                       
                       updateAlligator(percentage)
                       
                       withAnimation(.spring()) {
                           currentDragOffsetX = value.translation.width
                           alligatorDragOffsetX = value.translation.width * multiplier
                       }
                       
                       if (value.translation.width > maxDrag) {
                           withAnimation(.spring()) {
                               currentDragOffsetX = 0
                               endingDragOffsetX = screenWidth
                               alligatorDragOffsetX = maxDrag * multiplier
                           }
                           complete()
                       }
                   }
                   .onEnded { value in
                       withAnimation(.spring()) {
                           currentDragOffsetX = 0
                           if (!isCompleted) {
                               alligatorDragOffsetX = 0
                           }
                           
                       }
                   }
           ).overlay
           {
               viewModel.view()
                   .scaleEffect(x: -1.9, y: 1.9)
                   .frame(width: screenWidth, height: 350)
                   .offset(x: 50, y: -65)
                   .offset(x: screenWidth - alligatorDragOffsetX)
                   .allowsHitTesting(false)
           }
       }
   }

#Preview {
    TodoTitle(item: TodoModel(title: "test"), onComplete: {value in
    print("deleted")
    })
}
