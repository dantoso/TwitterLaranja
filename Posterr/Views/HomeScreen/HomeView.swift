import SwiftUI

struct HomeView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	let coordinator: HomeCoordinator
	
	init(viewModel: HomeViewModel, coordinator: HomeCoordinator) {
		self.viewModel = viewModel
		self.coordinator = coordinator
	}
	
	var body: some View {
		Group {
			if let posts = viewModel.posts {
				PostListView(posts: posts, user: DatabaseMock.defaultUser, coordinator: coordinator)
			}
			else {
				if viewModel.fetchFailed {
					Text("Failed to load posts.")
						.font(.headline)
				}
				else {
					Text("Loading posts...")
						.font(.headline)
				}
			}
		}
		.onAppear {
			viewModel.startFetchPosts()
		}
	}
}
