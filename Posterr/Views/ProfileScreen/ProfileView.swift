import SwiftUI

struct ProfileView: View {
	
	@State var viewModel: ProfileViewModel
	let coordinator: ProfileCoordinator
	
	var body: some View {
		VStack {
			HStack {
				Text(viewModel.user.username)
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
			
			Text("\(viewModel.user.postsMade.count) posts")
				.font(.footnote)
			
			PostListView(posts: viewModel.user.postsMade) {
				coordinator.writePost(withAuthor: viewModel.user)
			}
			Spacer()
		}
	}
}
