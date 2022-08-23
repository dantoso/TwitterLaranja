import SwiftUI

struct ProfilePostsView: View {
	
	@ObservedObject var viewModel: ProfileViewModel
	let coordinator: ProfileCoordinator
	
	var body: some View {
		VStack {
			Text("Posts made")
				.font(.title2)
				.padding([.top])
			
			Text("\(viewModel.user.originalPostsMade.count) original posts")
				.font(.footnote)
			
			Text(" \(viewModel.user.repostsMade.count) reposts")
				.font(.footnote)
			
			Text(" \(viewModel.user.quotePostsMade.count) quote posts")
				.font(.footnote)
			
			PostListView(posts: viewModel.allUserPosts()) {
				coordinator.writePost(withAuthor: viewModel.user)
			}
		}
	}
	
}

