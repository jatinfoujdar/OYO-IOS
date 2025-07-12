import SwiftUI

// Re-using the ListeningView struct from the previous immersive artifact.
// You would typically have this in a separate file or accessible scope.
struct ListeningView: View {
    // State variable to control the overall visibility and fade animation of the component.
    @Binding var showComponent: Bool // Changed to Binding to allow external control

    // State variable to hold the current heights of the individual sound wave bars.
    @State private var barHeights: [CGFloat] = Array(repeating: 4.0, count: 5)

    // State variable to control the phase of the wave animation, creating a continuous flow.
    @State private var wavePhase: Int = 0

    // Constants for bar dimensions and animation range.
    private let barWidth: CGFloat = 8
    private let minBarHeight: CGFloat = 4
    private let maxBarHeight: CGFloat = 30

    // A predefined pattern for the sound wave animation, creating a more natural look.
    private let wavePattern: [CGFloat] = [4, 10, 20, 30, 20, 10, 4]

    // Timers for managing the animations. Using `Timer` for bar animation and `Task` for overall sequence.
    @State private var barAnimationTimer: Timer?

    var body: some View {
        VStack {
            // "Listening..." Text
            Text("Listening...")
                .font(.system(size: 24, weight: .semibold)) // Bold and clear font
                .foregroundColor(.white) // White text color
                .padding(.bottom, 10) // Spacing below the text

            // Horizontal stack for the sound wave bars
            HStack(spacing: 4) {
                // Loop to create individual capsule bars
                ForEach(0..<barHeights.count, id: \.self) { index in
                    Capsule() // Rounded rectangular shape for the bars
                        .fill(Color.white) // White fill color
                        .frame(width: barWidth, height: barHeights[index]) // Set width and animated height
                        .animation(.easeInOut(duration: 0.3), value: barHeights[index]) // Smooth animation for height changes
                }
            }
        }
        .padding(20) // Padding around the content inside the component
        .background(Color.black.opacity(0.8)) // Semi-transparent dark background
        .cornerRadius(15) // Rounded corners for the component's background
        .opacity(showComponent ? 1.0 : 0.0) // Control overall visibility with opacity
        .animation(.easeInOut(duration: 0.5), value: showComponent) // Smooth animation for opacity changes
        .onChange(of: showComponent) { newValue in
            if newValue {
                startBarAnimation() // Start bar animation when component becomes visible
            } else {
                stopBarAnimation() // Stop bar animation when component becomes hidden
            }
        }
        .onDisappear {
            // Invalidate timers and cancel tasks when the view disappears to prevent memory leaks
            stopBarAnimation()
        }
    }

    // Function to manage the continuous animation of the sound wave bars.
    private func startBarAnimation() {
        // Ensure only one timer is active
        if barAnimationTimer == nil {
            barAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
                withAnimation {
                    // Advance the wave phase to create a continuous flow
                    wavePhase = (wavePhase + 1) % wavePattern.count
                    // Update each bar's height based on the wave pattern and current phase
                    for i in 0..<barHeights.count {
                        let patternIndex = (wavePhase + i) % wavePattern.count
                        barHeights[i] = wavePattern[patternIndex]
                    }
                }
            }
        }
    }

    // Function to stop the bar animation.
    private func stopBarAnimation() {
        barAnimationTimer?.invalidate()
        barAnimationTimer = nil
        // Reset bar heights when stopping animation
        barHeights = Array(repeating: minBarHeight, count: barHeights.count)
    }
}


struct SearchView: View {
    // State for the text in the search bar
    @State private var searchText: String = ""
    // State to control the visibility of the ListeningView
    @State private var isListening: Bool = false

    var body: some View {
        VStack {
            // Search Bar
            HStack {
                TextField("Search...", text: $searchText)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.leading) // Add padding to the left of the text field

                // Microphone Button
                Button(action: {
                    // Toggle the listening state
                    isListening.toggle()
                }) {
                    Image(systemName: isListening ? "mic.fill" : "mic") // Filled mic when listening
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.trailing) // Add padding to the right of the button
                }
            }
            .padding(.bottom, 20) // Padding below the search bar row

            // Listening Component - only shown when isListening is true
            if isListening {
                ListeningView(showComponent: $isListening)
                    .transition(.opacity) // Smooth transition for appearance/disappearance
            }

            Spacer() // Pushes content to the top
        }
        .padding(.top, 20) // Padding from the top of the screen
    }
}

// MARK: - Preview Provider
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.light) // You can change this to .dark if preferred
    }
}
