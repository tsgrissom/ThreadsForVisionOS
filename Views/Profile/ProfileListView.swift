import SwiftUI

struct ProfileListView: View {
    let lgTopInsets = EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
    let smTopInsets = EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
    var body: some View {
        ScrollView {
            VStack {
                ProfileAsListItemView()
                    .padding(lgTopInsets)
                ProfileAsListItemView()
                    .padding(smTopInsets)
                ProfileAsListItemView()
                    .padding(smTopInsets)
                ProfileAsListItemView()
                    .padding(smTopInsets)
                ProfileAsListItemView()
                    .padding(smTopInsets)
                ProfileAsListItemView()
                    .padding(smTopInsets)
            }
        }
    }
    
    private var listDivider: some View {
        return Divider()
            .overlay(.white)
            .frame(width: 275)
            .offset(x: -15)
    }
}

#Preview {
    ProfileListView()
}
