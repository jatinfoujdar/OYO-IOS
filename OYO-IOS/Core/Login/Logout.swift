import SwiftUI

struct Logout: View {
    @State private var username = ""
    @State private var email = "user@email@gmail.com"
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        ZStack {
            // Dark background
            Color(red: 0.15, green: 0.15, blue: 0.2)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {
                        // Back action
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 30) {
                    // Title
                    VStack(spacing: 8) {
                        Text("Create an")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("account")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    // Sign up with text
                    Text("Sign up with:")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    // Social login buttons
                    VStack(spacing: 16) {
                        SocialLoginButton(
                            icon: "google",
                            text: "Continue with Google",
                            action: {}
                        )
                        
                        SocialLoginButton(
                            icon: "facebook",
                            text: "Continue with Facebook",
                            action: {}
                        )
                        
                        SocialLoginButton(
                            icon: "apple",
                            text: "Continue with Apple",
                            action: {}
                        )
                    }
                    
                    // Form fields
                    VStack(spacing: 20) {
                        CustomTextField(
                            placeholder: "Username",
                            text: $username
                        )
                        
                        CustomTextField(
                            placeholder: "Email",
                            text: $email
                        )
                        
                        CustomPasswordField(
                            placeholder: "Password",
                            text: $password,
                            isVisible: $isPasswordVisible
                        )
                    }
                    .padding(.top, 20)
                    
                    // Register button
                    Button(action: {
                        // Register action
                    }) {
                        Text("Register")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(
                                LinearGradient(
                                    colors: [Color.blue, Color.blue.opacity(0.8)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(25)
                    }
                    .padding(.top, 20)
                    
                    // Bottom text
                    Text("I bought ticket, but I don't have an account")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.top, 20)
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
}

struct SocialLoginButton: View {
    let icon: String
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .font(.title3)
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white.opacity(0.1))
            .cornerRadius(25)
        }
    }
    
    private var iconName: String {
        switch icon {
        case "google":
            return "globe"
        case "facebook":
            return "f.circle.fill"
        case "apple":
            return "apple.logo"
        default:
            return "questionmark"
        }
    }
}

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(placeholder)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.medium)
            
            TextField("", text: $text)
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.bottom, 8)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3)),
                    alignment: .bottom
                )
        }
    }
}

struct CustomPasswordField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(placeholder)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.medium)
            
            HStack {
                if isVisible {
                    TextField("", text: $text)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                } else {
                    SecureField("", text: $text)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .padding(.bottom, 8)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3)),
                alignment: .bottom
            )
        }
    }
}

#Preview {
    Logout()
}
