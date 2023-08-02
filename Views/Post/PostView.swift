import SwiftUI
import RealityKit
import RealityKitContent

import LoremSwiftum

struct PostView: View {
    
    let displayReturnButton: Bool
    let displayHeader: Bool
    let isOwnedByUser: Bool
    let firstName: String
    let lastName: String
    
    @State var isLiked: Bool
    @State var isReposted: Bool
    
    init(displayReturnButton: Bool = false, displayHeader: Bool = true, isOwnedByUser: Bool = false,
         isLiked: Bool = false, isReposted: Bool = false) {
        self.displayReturnButton = displayReturnButton
        self.displayHeader = displayHeader
        self.isOwnedByUser = isOwnedByUser
        self.isLiked = isLiked
        self.isReposted = isReposted
        self.firstName = Lorem.firstName
        self.lastName = Lorem.lastName
    }
    
    var body: some View {
        ZStack {
            containerLayer
            containerContents
        }
        .frame(width: 550, height: 250)
        .foregroundStyle(.black)
    }
}

extension PostView {
    func getUsername() -> String {
        MockupUtilities.getMockUsername(firstName: self.firstName, lastName: self.lastName)
    }
    
    private var containerLayer: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
    }
    
    private var containerContents: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                headerRow
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            .zIndex(5)
            .frame(width: .infinity)
            .frame(height: 45)
            .clipShape(Capsule())
            // For noclip ScrollView to occlude the ScrollView if it goes behind the header
            
            HStack {
                postContentRow
                    .scrollIndicators(.hidden)
                    .frame(maxHeight: 120)
                    .frame(maxWidth: 500)
                    .lineLimit(5)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                    .background(Color.init(red: 249 / 255, green: 249 / 255, blue: 249 / 255))
                    .cornerRadius(10)
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            
            controlRow
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
        }
    }
    
    private var headerRow: some View {
        return HStack {
            ProfilePictureView(frameDimension: 45)
            Text(isOwnedByUser ? "Your Post" : self.getUsername())
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var postContentRow: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text(Lorem.tweet)
            }
        }
    }
    
    private var controlRow: some View {
        HStack(spacing: 4) {
            if self.isOwnedByUser {
                controlRowSelf
            } else {
                controlRowOther
            }
            Spacer()
        }
    }
    
    private var controlRowOther: some View {
        Group {
            HStack {
                if isLiked {
                    Button(action: {
                        self.isLiked = false
                    }, label: {
                        Text("Liked")
                    })
                } else {
                    Button(action: {
                        self.isLiked = true
                    }, label: {
                        Text("Like")
                    })
                }
            }
            .frame(width: 90)
            
            HStack {
                if isReposted {
                    Button(action: {
                        self.isReposted = false
                    }, label: {
                        Text("Reposted")
                    })
                } else {
                    Button(action: {
                        self.isReposted = true
                    }, label: {
                        Text("Repost")
                    })
                }
            }
            .frame(width: 130)
        }
    }
    
    private var controlRowSelf: some View {
        Group {
            Button(action: {
                
            }, label: {
                Label("Edit", systemImage: "pencil")
            })
            Button(action: {
                
            }, label: {
                Label("Delete", systemImage: "trash")
                    .foregroundStyle(.red)
            })
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        ScrollView {
            PostView(isOwnedByUser: false)
            PostView(isOwnedByUser: true)
        }
    }
}
