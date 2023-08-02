import SwiftUI

struct SearchView: View {
    
    @State var searchTextField: String
    
    init(searchTextField: String = "") {
        self.searchTextField = searchTextField
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                TextField("Search Threads...", text: $searchTextField)
                    .frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
            HStack {
                ProfileListView()
            }
        }
        .navigationTitle("Search")
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

