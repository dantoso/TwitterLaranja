import SwiftUI

struct ProfilePostsView: View {
	
	@State var viewModel: ProfilePostsViewModel
	let coordinator: ProfileCoordinator
	
	var body: some View {
		TabView {
			// original posts
			VStack {
				HStack {
					VStack {
						Text("Original posts")
						Text("\(viewModel.originalPosts.count) original posts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				
				PostListView(posts: viewModel.originalPosts, user: viewModel.user, coordinator: coordinator)
			}
			
			// reposts
			VStack {
				HStack {
					VStack {
						Text("Reposts")
						Text(" \(viewModel.reposts.count) reposts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				PostListView(posts: viewModel.reposts, user: viewModel.user, coordinator: coordinator)
			}
			
			// quote posts
			VStack {
				HStack {
					VStack {
						Text("Quote posts")
						Text(" \(viewModel.quotePosts.count) quote posts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				PostListView(posts: viewModel.quotePosts, user: viewModel.user, coordinator: coordinator)
			}
			
		}
		.tabViewStyle(.page(indexDisplayMode: .always))
	}
	
}

struct ProfilePostsViewModel {
	let user: User
	var originalPosts: [Post]
	var reposts: [Post]
	var quotePosts: [Post]
	
	init(profileViewModel: ProfileViewModel) {
		self.user = profileViewModel.user
		self.originalPosts = profileViewModel.user.originalPostsMade
		self.reposts = profileViewModel.user.repostsMade
		self.quotePosts = profileViewModel.user.quotePostsMade
	}
	
}

