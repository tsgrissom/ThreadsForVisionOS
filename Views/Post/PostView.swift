import SwiftUI
import RealityKit
import RealityKitContent

import LoremSwiftum

struct PostView: View {
    
    let displayReturnButton: Bool
    let displayHeader: Bool
    let isOwnedByUser: Bool
    
    @State var isLiked: Bool
    @State var isReposted: Bool
    
    init(displayReturnButton: Bool = false, displayHeader: Bool = true, isOwnedByUser: Bool = false,
         isLiked: Bool = false, isReposted: Bool = false) {
        self.displayReturnButton = displayReturnButton
        self.displayHeader = displayHeader
        self.isOwnedByUser = isOwnedByUser
        self.isLiked = isLiked
        self.isReposted = isReposted
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            containerLayer
            
            VStack(alignment: .leading, content: {
                if (displayHeader) {
                    headerRow
                }
                
                postContentRow
                    .frame(maxWidth: 500)
                
                if isOwnedByUser {
                    controlRowSelf
                } else {
                    controlRowOther
                }
            })
            .padding()
        }
        .foregroundStyle(.black)
    }
}

extension PostView {
    
    private var containerLayer: some View {
        return RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(maxWidth: 550)
            .frame(maxHeight: 300)
    }
    
    private var headerRow: some View {
        return HStack {
            ProfilePictureView(frameDimension: 45)
            Text(isOwnedByUser ? "@you" : "@username")
                .font(.largeTitle)
        }
    }
    
    private var postContentRow: some View {
        let postText = Lorem.tweet
        return HStack {
            ScrollView {
                Text(postText)
            }
            .frame(maxHeight: 140)
            Spacer()
        }
    }
    
    private var controlRowOther: some View {
        return HStack(spacing: 0) {
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
        return HStack {
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
    PostView(isOwnedByUser: false)
}
