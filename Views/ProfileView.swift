import SwiftUI

struct ProfileView: View {
    
    let isOwnedByUser = true
    let innerEdges = EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
    
    var body: some View {
        let navTitle: String = isOwnedByUser ? "Your Profile" : "Display Name"
        return VStack {
            upperPanel
            lowerPanel
                .scrollIndicators(.hidden)
            Spacer()
        }
        .foregroundStyle(.white)
        .navigationTitle(navTitle)
    }
}

extension ProfileView {
    
    func getFollowerCount() -> String {
        "\(MockupUtilities.getMockFollowerCount()) followers"
    }
    
    private var upperPanel: some View {
        HStack {
            VStack(alignment: .leading) {
                usernameRow
                followerRow
                topInteractionRow
                    .foregroundStyle(.black)
            }
            .padding(innerEdges)
            .frame(maxWidth: 400)
            Spacer()
        }
    }
    
    private var lowerPanel: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Text("Recent Posts")
                        .font(.extraLargeTitle2)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                
                HStack {
                    recentPostsSection
                        .scrollIndicators(.hidden)
                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 10))
            }
        }
    }
    
    private var fediverseLocation: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .frame(maxWidth: 110)
                .frame(maxHeight: 30)
            Text("threads.net")
                .foregroundStyle(.gray)
        }
    }
    
    private var usernameRow: some View {
        VStack {
            HStack {
                Text("@userhandle")
                fediverseLocation
                Spacer()
            }
        }
    }
    
    private var followerSamplePictureStack: some View {
        ZStack {
            ProfilePictureView(disableAnimation: true)
            ProfilePictureView(disableAnimation: true)
                .offset(x: 15)
            ProfilePictureView(disableAnimation: true)
                .offset(x: 30)
        }
    }
    
    private var followerRow: some View {
        HStack(spacing: 40) {
            followerSamplePictureStack
            Text(self.getFollowerCount())
            Spacer()
        }
    }
    
    private var topInteractionRow: some View {
        return HStack {
            if (isOwnedByUser) {
                Button("Edit profile") {
                    
                }
                .background(.white)
                .clipShape(Capsule())
                .buttonStyle(.borderless)
                
                Spacer()
                    .frame(maxWidth: 20)
                Button("Share profile") {
                    
                }
                .background(.white)
                .clipShape(Capsule())
                .buttonStyle(.borderless)
            }
            
        }
    }
    
    private var recentPostsSection: some View {
        ScrollView(.horizontal) {
            HStack {
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
                PostView(displayHeader: false, isOwnedByUser: isOwnedByUser)
            }
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ProfileView()
    }
}
