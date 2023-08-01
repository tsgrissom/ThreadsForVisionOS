import SwiftUI

struct SettingsPanelViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 150)
            .frame(maxWidth: 200)
            .fontWeight(.regular)
    }
}

struct SettingsPanelHeaderView: View {
    
    let title: String
    let initDividerWidth: CGFloat
    let dividerTapMultiplier: CGFloat
    
    @State var dividerWidth: CGFloat
    
    init(title: String, dividerWidth: CGFloat = 50, dividerTapMultiplier: CGFloat = 1.8) {
        self.title = title
        self.dividerWidth = dividerWidth
        self.initDividerWidth = dividerWidth
        self.dividerTapMultiplier = dividerTapMultiplier
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 20))
                .bold()
            Divider()
                .overlay(.black)
                .frame(width: dividerWidth)
        }
        .onTapGesture {
            withAnimation {
                dividerWidth *= dividerTapMultiplier
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                withAnimation {
                    dividerWidth = initDividerWidth
                }
            })
        }
    }
}

struct SettingsView: View {
    
    @State var isLoggedIn: Bool
    
    init(isLoggedIn: Bool = false) {
        self.isLoggedIn = isLoggedIn
    }
    
    let rowInsets = EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
    var body: some View {
        ScrollView {
            topRow
            middleRow
                .padding(rowInsets)
            bottomRow
                .padding(rowInsets)
            Spacer()
        }
        .scrollClipDisabled(true)
        .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 10))
        .foregroundStyle(.black)
        .navigationTitle("App Settings")
    }
}

extension SettingsView {
    private var topRow: some View {
        let panelModifier = SettingsPanelViewModifier()
        return HStack(spacing: 30) {
            appearancePanel
                .modifier(panelModifier)
            behaviorPanel
                .modifier(panelModifier)
            accessibilityPanel
                .modifier(panelModifier)
        }
    }
    
    private var middleRow: some View {
        let panelModifier = SettingsPanelViewModifier()
        return HStack(spacing: 30) {
            accountPanel
                .modifier(panelModifier)
            privacyPanel
                .modifier(panelModifier)
            notificationsPanel
                .modifier(panelModifier)
        }
    }
    
    private var bottomRow: some View {
        let panelModifier = SettingsPanelViewModifier()
        return HStack(spacing: 30) {
            helpPanel
                .modifier(panelModifier)
            aboutPanel
                .modifier(panelModifier)
        }
    }
    
    private var aboutPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "About")
            VStack(alignment: .leading) {
                Text("Some options")
                Text("Another option")
                Text("Yet another option")
            }
            .fontWeight(.regular)
        }
    }
    
    private var accessibilityPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Accessibility")
            VStack(alignment: .leading) {
                Text("Some options")
                Text("Another option")
                Text("Yet another option")
            }
        }
    }
    
    private var accountPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Account")
            VStack(alignment: .leading) {
                if isLoggedIn {
                    Button(action: {
                        self.isLoggedIn = false
                    }) {
                        Text("Log out")
                    }
                    .buttonStyle(.plain)
                } else {
                    Button(action: {
                        self.isLoggedIn = true
                    }) {
                        Text("Log in")
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        self.isLoggedIn = true
                    }) {
                        Text("Create account")
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    private var appearancePanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Appearance")
            VStack(alignment: .leading) {
                Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                    Text("Dark mode")
                })
                Button(action: {
                    
                }) {
                    Text("Theme options")
                }
                .buttonStyle(.plain)
            }
            .frame(width: 200 * 0.8)
        }
    }
    
    private var behaviorPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Behavior")
            VStack(alignment: .leading) {
                Text("Some options")
                Text("Another option")
                Text("Yet another option")
            }
            .fontWeight(.regular)
        }
    }
    
    private var notificationsPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Notifications")
            VStack(alignment: .leading) {
                Text("Some options")
                Text("Another option")
                Text("Yet another option")
            }
            .fontWeight(.regular)
        }
    }
    
    private var privacyPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Privacy")
            VStack(alignment: .leading) {
                Text("Some options")
                Text("Another option")
                Text("Yet another option")
            }
        }
    }
    
    private var helpPanel: some View {
        return VStack {
            SettingsPanelHeaderView(title: "Help")
            VStack(alignment: .leading) {
                Text("Some options")
                Text("Another option")
                Text("Yet another option")
            }
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.white.opacity(0.8))
        SettingsView()
    }
}

