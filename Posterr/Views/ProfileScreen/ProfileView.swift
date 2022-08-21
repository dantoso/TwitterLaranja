import SwiftUI

struct ProfileView: View {
	
	@State var viewModel: ProfileViewModel
	let coordinator: ProfileCoordinator
	
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
			
			PostListView(posts: viewModel.postsMade) {
				coordinator.writePost()
			}
			Spacer()
		}
	}
}
