import SwiftUI

struct PostView: View {
	
	let post: Post
	let repostAction: () -> Void
	let quotePostAction: () -> Void
	
	var body: some View {
		VStack {
			HStack {
				Text("\(post.authorName):")
					.font(.headline)
				Spacer()
			}
			
			HStack {
				if post.content.isEmpty {
					EmptyView()
				}
				else {
					Text(post.content)
						.padding([.leading])
						.font(.body)
					Spacer()
				}
				
			}
			
			if let mention = post.mention {
				MentionView(post: mention)
			}
			
			HStack {
				Button("Repost", action: repostAction)
					.padding([.top])
					.buttonStyle(.borderless)
					.foregroundColor(Color(uiColor: .systemOrange))
				
				Spacer()
				
				Button("Quote post", action: quotePostAction)
					.padding([.top])
					.buttonStyle(.borderless)
					.foregroundColor(Color(uiColor: .systemOrange))
			}
		}
	}
	
}

