import SwiftUI

struct MentionView: View {
	
	let post: Post
	
	var body: some View {
		VStack {
			HStack {
				Text("\(post.authorName):")
					.padding([.leading])
					.padding([.leading])
					.font(.subheadline)
				Spacer()
			}
			HStack {
				Text(post.content)
					.padding([.leading])
					.padding([.leading])
					.padding([.leading])
					.font(.footnote)
				Spacer()
			}
		}
	}
	
}
