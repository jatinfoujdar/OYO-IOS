import SwiftUI
import RiveRuntime

struct TapBarView: View {
    @AppStorage("selectTab") var selectTab : Tab = .chat
    
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                ForEach(tabItems) { item in
                    Button {
                        item.icons.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            item.icons.setInput("active", value: false)
                        }
                        withAnimation{
                            selectTab = item.tab
                        }
                    } label: {
                        item.icons.view()
                            .frame(height: 36)
                            .opacity(selectTab == item.tab ? 1: 0.5)
                            .background(
                                VStack{
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: 20 ,height: 4)
                                        .offset(y: -20)
                                        .opacity(selectTab == item.tab ? 1 : 0)
                                }
                            )
                    }
                }
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3),radius: 20, x: 0, y: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .padding(.horizontal,24)
        }
    }
}

#Preview {
    TapBarView()
}

struct TabItem: Identifiable {
    var id = UUID()
    var icons: RiveViewModel
    var tab : Tab
}

var tabItems = [
    TabItem(icons: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"),tab: .chat),
    TabItem(icons: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"),tab: .search),
    TabItem(icons: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
    TabItem(icons: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab:  .bell),
    TabItem(icons: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
]


enum Tab : String{
    case chat
    case search
    case timer
    case bell
    case user
}
