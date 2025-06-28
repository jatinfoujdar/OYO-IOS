////
////  Untitled.swift
////  OYO-IOS
////
////  Created by jatin foujdar on 28/06/25.
////
//
////
////  TodoItem.swift
////  Alligator Todo
////
////  Created by Peter G Hayes on 21/08/2023.
////  Updated by ChatGPT on 28/06/2025 to fix swipe reset behavior.
////
//
//import SwiftUI
//import RiveRuntime
//
//struct TodoTile: View {
//    let item: TodoModel
//    let onComplete: (_ item: TodoModel) -> Void
//
//    @State private var currentDragOffsetX: CGFloat = 0
//    @State private var alligatorDragOffsetX: CGFloat = 0
//    @State private var endingDragOffsetX: CGFloat = 0
//    @State private var isCompleted = false
//
//    private let screenWidth = UIScreen.main.bounds.width
//    private let maxDrag = 200.0
//    private let multiplier = 1.9
//
//    @StateObject private var viewModel = RiveViewModel(
//        fileName: "alligator_swipe",
//        fit: .fitWidth
//    )
//
//    func updateAlligator(_ value: Double) {
//        print("Setting scroll to:", value) // for debugging
//        viewModel.setInput("scroll", value: value)
//    }
//
//    func complete() {
//        isCompleted = true
//        updateAlligator(100)
//
//        withAnimation(.spring().delay(1)) {
//            alligatorDragOffsetX = 0
//        } completion: {
//            onComplete(item)
//        }
//    }
//
//    var body: some View {
//        HStack {
//            Text(item.title)
//                .foregroundColor(.white)
//                .font(.headline)
//            Spacer()
//        }
//        .padding()
//        .background(Color("Card"))
//        .cornerRadius(16)
//        .shadow(color: .black.opacity(0.2), radius: 6, x: 3, y: 3)
//        .padding(.horizontal)
//        .offset(x: currentDragOffsetX + endingDragOffsetX)
//        .gesture(
//            DragGesture()
//                .onChanged { value in
//                    if isCompleted || value.translation.width < -30 {
//                        return
//                    }
//
//                    let percentage = value.translation.width / screenWidth * (100 * multiplier)
//                    updateAlligator(percentage)
//
//                    withAnimation(.spring()) {
//                        currentDragOffsetX = value.translation.width
//                        alligatorDragOffsetX = value.translation.width * multiplier
//                    }
//
//                    if value.translation.width > maxDrag {
//                        withAnimation(.spring()) {
//                            currentDragOffsetX = 0
//                            endingDragOffsetX = screenWidth
//                            alligatorDragOffsetX = maxDrag * multiplier
//                        }
//                        complete()
//                    }
//                }
//                .onEnded { _ in
//                    withAnimation(.spring()) {
//                        currentDragOffsetX = 0
//                        if !isCompleted {
//                            alligatorDragOffsetX = 0
//                            updateAlligator(0) // 🧠 KEY LINE: Reset the Rive animation
//                        }
//                    }
//                }
//        )
//        .overlay(
//            viewModel.view()
//                .frame(width: screenWidth, height: 250)
//                .offset(x: 2, y: -25)
//                .offset(x: screenWidth - alligatorDragOffsetX)
//                .allowsHitTesting(false)
//        )
//    }
//}
//
