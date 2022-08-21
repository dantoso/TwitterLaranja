import SwiftUI

struct PostListView: View {
	
	let posts: [Post]
	
	var body: some View {
		List {
			ForEach(0..<posts.count, id: \.self) { i in
				PostView(post: posts[i])
			}
		}
	}
}
