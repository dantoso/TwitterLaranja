import SwiftUI

struct ProfilePostsView: View {
	
	@ObservedObject var viewModel: ProfileViewModel
	let coordinator: ProfileCoordinator
	
	var body: some View {
		TabView {
			// original posts
			VStack {
				HStack {
					VStack {
						Text("Original posts")
						Text("\(viewModel.user.originalPosts.count) original posts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				
				PostListView(posts: viewModel.user.originalPosts, user: viewModel.user, coordinator: coordinator)
			}
			
			// reposts
			VStack {
				HStack {
					VStack {
						Text("Reposts")
						Text(" \(viewModel.user.reposts.count) reposts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				PostListView(posts: viewModel.user.reposts, user: viewModel.user, coordinator: coordinator)
			}
			
			// quote posts
			VStack {
				HStack {
					VStack {
						Text("Quote posts")
						Text(" \(viewModel.user.quotePosts.count) quote posts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				PostListView(posts: viewModel.user.quotePosts, user: viewModel.user, coordinator: coordinator)
			}
			
		}
		.tabViewStyle(.page(indexDisplayMode: .always))
	}
	
}
