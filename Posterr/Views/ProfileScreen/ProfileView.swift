import SwiftUI

struct ProfileView: View {
	
	@ObservedObject var viewModel: ProfileViewModel
	let coordinator: ProfileCoordinator
	
	var body: some View {
		ProfileExistsView(user: viewModel.user, formmatedDate: viewModel.formmatedDate)
			.environmentObject(coordinator)
	}
}

struct ProfileExistsView: View {
	
	let user: User
	let formmatedDate: String
	@EnvironmentObject var coordinator: ProfileCoordinator
	
	var body: some View {
		VStack {
			HStack {
				Text(user.username)
					.padding([.leading, .top])
					.font(.largeTitle)
				Spacer()
			}
			HStack {
				Text("Date joined: \(formmatedDate)")
					.font(.footnote)
					.padding([.horizontal])
				Spacer()
			}
			
			Text("Posts made")
				.font(.title2)
				.padding([.top])
			
			Text("\(user.postsMade.count) posts")
				.font(.footnote)
			
			PostListView(posts: user.postsMade) {
				coordinator.writePost(withAuthor: user)
			}
			Spacer()
		}
	}
}
