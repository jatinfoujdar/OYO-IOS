import SwiftUI

struct SecureCashStorageView: View {
    var body: some View {
        ZStack {
            // Dark background
            Color(red: 0.1, green: 0.1, blue: 0.15)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
  
                
                
                Spacer()
                
                // Main illustration area
                VStack(spacing: 20) {
                    // 3D Illustration placeholder
                    ZStack {
                        // Safe/Vault
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(
                                    colors: [Color.red.opacity(0.8), Color.gray.opacity(0.4)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 120, height: 80)
                            .overlay(
                                Circle()
                                    .fill(Color.black.opacity(0.3))
                                    .frame(width: 20, height: 20)
                                    .offset(x: 15)
                            )
                        
                        // Large coin
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [Color.green, Color.gray.opacity(0.7)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 80, height: 80)
                            .overlay(
                                Text("$")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.gray.opacity(0.6))
                            )
                            .offset(x: -20, y: -40)
                        
                        // Small coins stack
                        HStack(spacing: -8) {
                            ForEach(0..<3) { _ in
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [Color.white.opacity(0.9), Color.gray.opacity(0.6)],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(width: 25, height: 25)
                            }
                        }
                        .offset(x: 60, y: 20)
                        
                        // AirPods case
                        RoundedRectangle(cornerRadius: 15)
                            .fill(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.9), Color.gray.opacity(0.5)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 35)
                            .offset(x: -80, y: 30)
                        
                        // Sparkle effect
                        Image(systemName: "sparkles")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.8))
                            .offset(x: -40, y: -80)
                    }
                    .frame(height: 200)
                }
                
                Spacer()
                
                // Content section
                VStack(spacing: 16) {
                    Text("Secure Cash Storage")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Efficient cash vault management ensures security")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                
                // Get Started button
                Button(action: {}) {
                    Text("Get Started")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            LinearGradient(
                                colors: [Color.blue, Color.blue.opacity(0.8)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(28)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }
}

struct SecureCashStorageView_Previews: PreviewProvider {
    static var previews: some View {
        SecureCashStorageView()
    }
}
