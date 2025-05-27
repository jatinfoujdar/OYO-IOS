import SwiftUI
import RiveRuntime

// MARK: Rive Pull to Refresh View
struct CustomRivePullToRefreshView<Content: View>: View {
    var content: Content
    var showsIndicator: Bool
    var onRefresh: () async -> ()
    var height: Double

    init(showsIndicator: Bool = false, height: Double = 200, @ViewBuilder content: @escaping () -> Content, onRefresh: @escaping () async -> ()) {
        self.showsIndicator = showsIndicator
        self.content = content()
        self.onRefresh = onRefresh
        self.height = height
    }

    @StateObject var riveViewModel = RiveViewModel(fileName: "pull_to_refresh_use_case", fit: .cover, autoPlay: false)
    @StateObject var scrollDelegate: CustomScrollViewModel = .init()

    var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicator) {
            VStack {
                if scrollDelegate.progress > 0 {
                    riveViewModel.view().background(.blue)
                        .frame(height: 150 * scrollDelegate.progress)
                        .offset(y: scrollDelegate.isEligible ? -(scrollDelegate.contentOffset < 0 ? 0 : scrollDelegate.contentOffset) : -(scrollDelegate.scrollOffset < 0 ? 0 : scrollDelegate.scrollOffset))
                }

                content
            }
            .onChange(of: scrollDelegate.isRefreshing) { refreshing in
                if refreshing {
                    Task {
                        riveViewModel.triggerInput("advance")
                        let backTime = 0.25
                        await onRefresh()
                        riveViewModel.triggerInput("advance")
                        try? await Task.sleep(for: .seconds(2))

                        withAnimation(.easeInOut(duration: backTime)) {
                            scrollDelegate.progress = 0
                            scrollDelegate.isEligible = false
                            scrollDelegate.isRefreshing = false
                            scrollDelegate.scrollOffset = 0
                        }

                        try? await Task.sleep(for: .seconds(backTime))
                        riveViewModel.reset()
                    }
                }
            }
            .coordinateSpace(name: "SCROLL")
            .onAppear(perform: scrollDelegate.addGesture)
            .onDisappear(perform: scrollDelegate.removeGesture)
            .offset(coordinateSpace: "SCROLL") { offset in
                scrollDelegate.contentOffset = offset

                if !scrollDelegate.isEligible {
                    var progress = offset / 150
                    progress = max(0, min(progress, 1))
                    scrollDelegate.scrollOffset = offset
                    scrollDelegate.progress = progress
                }

                let inputValue = offset / 150 * 100
                riveViewModel.setInput("pull", value: inputValue)

                if scrollDelegate.progress == 0 && !scrollDelegate.isEligible {
                    riveViewModel.reset()
                }

                if scrollDelegate.isEligible && !scrollDelegate.isRefreshing {
                    scrollDelegate.isRefreshing = true
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
            }
        }
    }
}

struct CustomRivePullToRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRivePullToRefreshView() {
            Rectangle()
                .fill(.green)
                .frame(height: 100)
            Rectangle()
                .fill(.blue)
                .frame(height: 100)
            Rectangle()
                .fill(.red)
                .frame(height: 100)
        } onRefresh: {
            try? await Task.sleep(nanoseconds: 3_000_000_000)
        }
    }
}


// MARK: Custom Scroll View Model
class CustomScrollViewModel: NSObject, ObservableObject, UIGestureRecognizerDelegate {
    @Published var isEligible: Bool = false
    @Published var isRefreshing: Bool = false
    @Published var scrollOffset: CGFloat = 0
    @Published var contentOffset: CGFloat = 0
    @Published var progress: CGFloat = 0

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    func addGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onGestureChange(gesture:)))
        panGesture.delegate = self
        rootController().view.addGestureRecognizer(panGesture)
    }

    func removeGesture() {
        rootController().view.gestureRecognizers?.removeAll()
    }

    func rootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }

    @objc func onGestureChange(gesture: UIPanGestureRecognizer) {
        if gesture.state == .cancelled || gesture.state == .ended {
            if !isRefreshing {
                isEligible = scrollOffset > 150
            }
        }
    }
}

// MARK: Offset Modifier
extension View {
    @ViewBuilder
    func customOffset(coordinateSpace: String, offset: @escaping (CGFloat) -> ()) -> some View {
            self
            .overlay {
                GeometryReader { geometry in
                    let minY = geometry.frame(in: .named(coordinateSpace)).minY
                    Color.clear
                        .preference(key: CustomOffsetKey.self, value: minY)
                        .onPreferenceChange(CustomOffsetKey.self) { value in
                            offset(value)
                        }
                }
            }
    }
}

// MARK: Offset Preference Key
struct CustomOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
