import SwiftUI

struct PostView: View {
	
	let post: Post
	
	var body: some View {
		VStack {
			HStack {
				Text("\(post.authorName):")
					.font(.headline)
				Spacer()
			}
			
			HStack {
				Text(post.content)
					.padding([.leading])
					.font(.body)
	
				Spacer()
			}
			
			if let mention = post.mention {
				MentionView(post: mention)
			}
		}
	}
	
}


struct PostView_Previews: PreviewProvider {
	static var previews: some View {
		PostView(post: Post(author: User(username: "test1"), content: "heyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyheyhey!", mention: Post(author: User(username: "test2"), content: "hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello")))
	}
}

