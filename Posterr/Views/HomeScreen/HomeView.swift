import SwiftUI

struct HomeView: View {
	
	@State var viewModel = HomeViewModel()
	let coordinator: HomeCoordinator
	
	var body: some View {
		Group {
			if let posts = viewModel.posts {
				PostListView(posts: posts) {
					coordinator.writePost(withAuthor: DatabaseMock.defaultUser)
				}
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
			print("started fetching posts...")
			viewModel.startFetchPosts()
		}
	}
}
