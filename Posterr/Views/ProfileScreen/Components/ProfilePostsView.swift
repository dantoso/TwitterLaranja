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
						Text("\(viewModel.originalPosts.count) original posts")
							.font(.footnote)
					}
					.padding()
					Spacer()
				}
				
				PostListView(posts: viewModel.originalPosts, user: viewModel.user, coordinator: coordinator)
					.onAppear {
						viewModel.user = DatabaseMock.defaultUser
					}
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
					.onAppear {
						viewModel.user = DatabaseMock.defaultUser
					}
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
					.onAppear {
						viewModel.user = DatabaseMock.defaultUser
					}
			}
			
		}
		.tabViewStyle(.page(indexDisplayMode: .always))
	}
	
}
