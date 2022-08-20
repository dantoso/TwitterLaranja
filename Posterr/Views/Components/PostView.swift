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

