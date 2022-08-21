import SwiftUI

struct ProfileView: View {
	
	let user = User(username: "Alpha")
	
	var body: some View {
		VStack {
			HStack {
				Text(user.username)
					.padding([.leading, .top])
					.font(.title)
				Spacer()
			}
			HStack {
				Text("Date joined: \(user.dateJoined)")
					.font(.footnote)
					.padding([.horizontal])
				Spacer()
			}
			
			Text("Posts made")
				.font(.title2)
				.padding([.top])
			
			Text("\(user.postsMade.count) posts")
				.font(.footnote)
			
			Button("Write new post") {
				//TODO: write new post feature
			}
			.padding()
			
			if !user.postsMade.isEmpty {
				PostListView(posts: user.postsMade)
			}
			Spacer()
		}
		.preferredColorScheme(.dark)
	}
}
