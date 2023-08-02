import SwiftUI

import LoremSwiftum

struct ProfileAsListItemView: View {
    
    @State private var followingButtonText:String
    
    init(followingButtonText: String = "Follow") {
        self.followingButtonText = followingButtonText
    }
    
    var body: some View {
        HStack(spacing: 0) {
            profilePictureColumn
            followerPictureSampleColumn
                .frame(width: 30)
            infoColumn
                .frame(width: 250)
                .frame(height: 100)
            followActionColumn
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 100)
    }
}

extension ProfileAsListItemView {
    func getUsername() -> String {
        MockupUtilities.getMockUsername()
    }
    
    func getDisplayName() -> String {
        Lorem.fullName
    }
    
    func getFollowerCount() -> String {
        "\(MockupUtilities.getMockFollowerCount()) followers"
    }
    
    private var profilePictureColumn: some View {
        VStack {
            ProfilePictureView(frameDimension: 65, lineWidth: 0)
            Spacer()
        }
    }
    
    private var followerPictureSampleColumn: some View {
        let fd: CGFloat = 20
        let lw: CGFloat = 0.5
        return VStack {
            Spacer()
            HStack {
                ZStack {
                    ProfilePictureView(disableAnimation: true, frameDimension: fd, lineWidth: lw)
                        .offset(x: -5)
                    ProfilePictureView(disableAnimation: true, frameDimension: fd, lineWidth: lw)
                        .offset(x: 4)
                }
            }
            Spacer()
                .frame(maxHeight: 7)
        }
    }
    
    private var infoColumn: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(getUsername())
                    .bold()
                Text(getDisplayName())
                    .fontWeight(.regular)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Spacer()
                    .frame(height: 10)
                Text(getFollowerCount())
                    .fontWeight(.regular)
            }
            .foregroundStyle(.white)
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
            Spacer()
        }
    }
    
    private var followActionColumn: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 5)
            Button(action: {
                if (self.followingButtonText == "Follow") {
                    self.followingButtonText = "Following"
                } else {
                    self.followingButtonText = "Follow"
                }
            }, label: {
                Text(self.followingButtonText)
            })
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ScrollView {
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
            ProfileAsListItemView()
        }
    }
}
