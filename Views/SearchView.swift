import SwiftUI

struct SearchView: View {
    
    @State var searchTextField: String
    
    init(searchTextField: String = "") {
        self.searchTextField = searchTextField
    }
    
    var body: some View {
        let searchFieldPrompt = Text("Search Threads...")
            .foregroundStyle(.gray)
        VStack {
            HStack(alignment: .center) {
                TextField(text: $searchTextField, prompt: searchFieldPrompt, label: {
                    
                })
                .frame(width: 300, height: 40)
                .background(.white.opacity(0.9))
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
            .background(.red)
            HStack {
                ProfileListView()
            }
        }
        .navigationTitle("Search Threads")
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        SearchView()
            .foregroundStyle(.white)
    }
}

