import SwiftUI

struct PostListView: View {
	
	let posts: [Post]
	let writeNewPostAction: () -> Void
	
	var body: some View {
		List {
			
			Button("Write new post...", action: writeNewPostAction)
				.foregroundColor(Color(uiColor: .systemOrange))
			
			ForEach(0..<posts.count, id: \.self) { i in
				PostView(post: posts[i])
			}
		}
	}
}
