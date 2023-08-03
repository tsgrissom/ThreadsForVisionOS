import SwiftUI

struct NewThreadView: View {
    
    let visibilityOptions: [String] = ["Anyone can reply", "Profiles you follow", "Mentioned only"]
    
    @State private var initialPostText: String = ""
    @State private var subsequentPostText: String = ""
    @State private var postVisibility: String = "Anyone can reply"
    
    var body: some View {
        HStack {
            leftPane
                .frame(width: 400)
                .padding(.top, 15)
                .padding(.leading, 25)
            rightPane
                .frame(width: 180)
                .padding(.top, 15)
            Spacer()
        }
        .navigationTitle("New thread")
    }
}

extension NewThreadView {
    func cycleVisibility() {
        var ind = visibilityOptions.firstIndex(of: self.postVisibility) ?? 0
        
        ind += 1
        
        if ind >= visibilityOptions.count {
            ind = 0
        }
        
        self.postVisibility = visibilityOptions[ind]
    }
    
    private var leftPane: some View {
        return VStack {
            VStack {
                initialPostRow
                interThreadRow
                    .padding(.leading, 45)
                ScrollView {
                    subsequentPostRow
                        .padding(.top, 1)
                        .padding(.leading, 36)
                }
                .scrollIndicators(.hidden)
            }
            Spacer()
        }
    }
    
    private var rightPane: some View {
        return VStack {
            postSettingsSection
                .padding(.leading, 10)
                .padding(.bottom, 20)
            Spacer()
        }
    }
    
    private var initialPostRow: some View {
        let promptText: Text = Text("Start a thread...")
            .foregroundStyle(.gray)
        
        return HStack {
            ProfilePictureView(disableAnimation: true, frameDimension: 85)
            VStack {
                HStack {
                    Text("username")
                        .bold()
                    Spacer()
                }
                TextField(text: $initialPostText, prompt: promptText, label: {
                    
                })
            }
        }
    }
    
    private var interThreadRow: some View {
        return HStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.gray)
                .frame(width: 3, height: 100)
            Button(action: {
                
            }) {
                Image(systemName: "paperclip")
            }
            .padding(.leading, 35)
            Spacer()
        }
    }
    
    private var subsequentPostRow: some View {
        let promptText: Text = Text("Add to thread")
            .foregroundStyle(.gray)
        
        return HStack {
            Image(systemName: "plus.square")
                .font(.system(size: 20))
            TextField(text: $subsequentPostText, prompt: promptText, label: {
                
            })
            .foregroundStyle(.black)
            .padding(.leading, 25.5)
            Spacer()
        }
    }
    
    private var postSettingsSection: some View {
        return VStack(alignment: .leading) {
            Button(action: {
                self.cycleVisibility()
            }) {
                Text(self.postVisibility)
                    .foregroundStyle(.gray)
                    .frame(width: 160, alignment: .leading)
            }
            .buttonStyle(.plain)
            .padding(.top, 16)
            Button(action: {
                
            }) {
                Text("Post")
                    .bold()
                    .foregroundStyle(.blue)
            }
            .buttonStyle(.plain)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        NewThreadView()
    }
}
