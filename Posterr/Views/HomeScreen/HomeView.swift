import SwiftUI

struct HomeView: View {
	
	let testPosts: [Post] = [Post(author: User(username: "test1"),
								  content: "heyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyhey!",
								  mention: Post(author: User(username: "test2"),
												content: "hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello")),
							 
							 Post(author: User(username: "test1"),
								  content: "heyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyhey!")]
	
	var body: some View {
		PostListView(posts: testPosts)
			.preferredColorScheme(.dark)
	}
}
