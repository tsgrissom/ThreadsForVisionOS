import SwiftUI

struct ProfileListView: View {
    var body: some View {
        ScrollView {
            ProfileAsListItemView()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            listDivider
            ProfileAsListItemView()
            listDivider
            ProfileAsListItemView()
            listDivider
            ProfileAsListItemView()
            listDivider
            ProfileAsListItemView()
            listDivider
            ProfileAsListItemView()
        }
    }
    
    private var listDivider: some View {
        return Divider()
            .overlay(.white)
            .frame(width: 480)
    }
}

#Preview {
    ProfileListView()
}
