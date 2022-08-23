import SwiftUI

struct PostListView: View {
	
	let posts: [Post]
	let user: User
	let coordinator: PostWriterCoordinator

	var body: some View {
		List {
			
			Button("Write new post...") {
				coordinator.writePost(withAuthor: user)
			}
			.foregroundColor(Color(uiColor: .systemOrange))
			
			ForEach((0..<posts.count).reversed(), id: \.self) { i in
				PostView(post: posts[i]) {
					coordinator.writeRepost(withAuthor: user, mentioning: posts[i])
				} quotePostAction: {
					coordinator.writeQuotePost(withAuthor: user, mentioning: posts[i])
				}

			}
		}
	}
}
