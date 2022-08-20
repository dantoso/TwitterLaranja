import SwiftUI

struct MentionView: View {
	
	let post: Post
	
	var body: some View {
		VStack {
			HStack {
				Text("\(post.authorName): \(post.content)")
					.padding([.leading])
					.padding([.leading])
					.font(.subheadline)
				Spacer()
			}
		}
	}
	
}
