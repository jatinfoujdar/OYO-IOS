import SwiftUI

struct SearchFilterBarView: View {
    @State private var isRecording = false
    @State private var isCompleted = false
    @State private var textOpacity = 1.0
    @State private var backgroundScale = 0.0
    @State private var rotationAngle = 0.0
    @State private var animatingDots = Array(repeating: false, count: 5)
    @State private var listeningTextOpacity = 0.0
    @State private var expandingBackgroundScale = 0.0
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(isRecording ? .white : .black)
                    .opacity(isRecording ? 0 : 1)
                    .animation(.easeInOut(duration: 0.5), value: isRecording)
                
                // Main content area
                ZStack {
                    // Normal state content
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Where to?")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .opacity(textOpacity)
                            
                            Text("Any Week . Add Guest")
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .opacity(textOpacity)
                        }
                        
                        Spacer()
                    }
                    .opacity(isRecording ? 0 : 1)
                    .animation(.easeInOut(duration: 0.4), value: isRecording)
                    
                    // Listening state content
                    HStack {
                        Button(action: {
                            stopRecording()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            // Animated dots
                            HStack(spacing: 3) {
                                ForEach(0..<5) { index in
                                    Circle()
                                        .fill(Color.white.opacity(0.8))
                                        .frame(width: 4, height: 4)
                                        .scaleEffect(animatingDots[index] ? 1.0 : 0.5)
                                        .animation(
                                            .easeInOut(duration: 0.5)
                                            .repeatForever(autoreverses: true)
                                            .delay(Double(index) * 0.1),
                                            value: animatingDots[index]
                                        )
                                }
                            }
                            
                            Text("Listening...")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                                .opacity(listeningTextOpacity)
                                .animation(.easeInOut(duration: 0.4).delay(0.2), value: listeningTextOpacity)
                        }
                        Spacer()

                        
                        Button(action: {
                            completeListening()
                        }) {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .padding(6)
                                .background(Circle().fill(Color.green))
                        }
                    }
                    .opacity(isRecording ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5).delay(0.3), value: isRecording)
                }
                
                // Right side buttons
                HStack(spacing: 16) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            rotationAngle += 180
                            isCompleted.toggle()
                        }
                    }) {
                        Image(systemName: isCompleted ? "checkmark" : "line.3.horizontal.decrease.circle")
                            .foregroundStyle(isRecording ? .white : .black)
                            .rotationEffect(.degrees(rotationAngle))
                    }
                    .opacity(isRecording ? 0 : 1)
                    .animation(.easeInOut(duration: 0.4), value: isRecording)
                    
                    // Microphone button
                    Button(action: {
                        startRecording()
                    }) {
                        Image(systemName: "mic.circle.fill")
                            .foregroundStyle(isRecording ? .white : .black)
                    }
                    .opacity(isRecording ? 0 : 1)
                    .animation(.easeInOut(duration: 0.3), value: isRecording)
                }
            }
            .padding()
            .font(.title2)
            .background(
                ZStack {
                    // Expanding background from microphone position - clipped to capsule
                    Capsule()
                        .fill(Color.black)
                        .mask(
                            Circle()
                                .scaleEffect(expandingBackgroundScale)
                                .position(x: UIScreen.main.bounds.width - 80, y: 25)
                        )
                        .animation(.spring(response: 0.8, dampingFraction: 0.7), value: expandingBackgroundScale)
                    
                    // Fallback background for smooth transition
                    Capsule()
                        .fill(Color.black)
                        .opacity(isRecording ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.6).delay(0.2), value: isRecording)
                }
            )
            .overlay(
                Capsule()
                    .stroke(lineWidth: 0.5)
                    .foregroundStyle(Color(.systemGray4))
                    .shadow(color: .black.opacity(0.4), radius: 2)
                    .opacity(isRecording ? 0 : 1)
                    .animation(.easeInOut(duration: 0.5), value: isRecording)
            )
            .padding(.horizontal)
            
            IconScrollView()
        }
    }
    
    private func startRecording() {
        // Start recording animation with smooth transitions
        withAnimation(.spring(response: 0.8, dampingFraction: 0.7)) {
            isRecording = true
            expandingBackgroundScale = 15.0 // Larger scale for smooth expansion
        }
        
        // Fade out normal text smoothly
        withAnimation(.easeInOut(duration: 0.5)) {
            textOpacity = 0.0
        }
        
        // Start dot animations
        for i in 0..<animatingDots.count {
            animatingDots[i] = true
        }
        
        // Fade in listening text with delay for smooth transition
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeInOut(duration: 0.6)) {
                listeningTextOpacity = 1.0
            }
        }
    }
    
    private func stopRecording() {
        // Fade out listening text first
        withAnimation(.easeInOut(duration: 0.4)) {
            listeningTextOpacity = 0.0
        }
        
        // Stop recording animation with smooth spring
        withAnimation(.spring(response: 0.8, dampingFraction: 0.7)) {
            isRecording = false
            expandingBackgroundScale = 0.0
        }
        
        // Fade in normal text with delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeInOut(duration: 0.6)) {
                textOpacity = 1.0
            }
        }
        
        // Stop dot animations
        for i in 0..<animatingDots.count {
            animatingDots[i] = false
        }
    }
    
    private func completeListening() {
        // Complete listening with checkmark feedback
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            // Add any completion logic here
        }
        
        // Return to normal state after brief delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            stopRecording()
        }
    }
}



// Example preview
#Preview {
    SearchFilterBarView()
}
