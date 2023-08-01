import SwiftUI

struct ProfileListView: View {
    let lgTopInsets = EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
    let smTopInsets = EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
    var body: some View {
        ScrollView {
            ProfileAsListItemView()
                .padding(lgTopInsets)
            listDivider
            ProfileAsListItemView()
                .padding(smTopInsets)
            listDivider
            ProfileAsListItemView()
                .padding(smTopInsets)
            listDivider
            ProfileAsListItemView()
                .padding(smTopInsets)
            listDivider
            ProfileAsListItemView()
                .padding(smTopInsets)
            listDivider
            ProfileAsListItemView()
                .padding(smTopInsets)
        }
        .scrollClipDisabled(true)
    }
    
    private var listDivider: some View {
        return Divider()
            .overlay(.white)
            .frame(width: 420)
    }
}

#Preview {
    ProfileListView()
}
