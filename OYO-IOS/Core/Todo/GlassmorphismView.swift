//
//  Glassmorphism.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 26/06/25.
//

import SwiftUI
import RiveRuntime

struct GlassmorphismView: View {
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
            
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 30)
                .background(
                    Image("Spline")
                        .blur(radius: 50)
                        .offset(x: 200, y: 100)
                )
            
            TodoList()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.leading)
        .ignoresSafeArea()
    }
}

#Preview {
    GlassmorphismView()
}
