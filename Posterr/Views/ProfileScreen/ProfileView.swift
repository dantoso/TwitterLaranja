import SwiftUI

struct ProfileView: View {
	
	@State var viewModel = ProfileViewModel(user: User(username: "Alpha"))
	
	var body: some View {
		VStack {
			HStack {
				Text(viewModel.username)
					.padding([.leading, .top])
					.font(.largeTitle)
				Spacer()
			}
			HStack {
				Text("Date joined: \(viewModel.formmatedDate)")
					.font(.footnote)
					.padding([.horizontal])
				Spacer()
			}
			
			Text("Posts made")
				.font(.title2)
				.padding([.top])
			
			Text("\(viewModel.postsMade.count) posts")
				.font(.footnote)
			
			Button("Write new post") {
				//TODO: write new post feature
			}
			.foregroundColor(Color(uiColor: .systemOrange))
			.padding()
			
			if !viewModel.postsMade.isEmpty {
				PostListView(posts: viewModel.postsMade)
			}
			Spacer()
		}
	}
}
