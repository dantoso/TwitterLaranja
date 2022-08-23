import SwiftUI

struct ProfileView: View {
	
	@StateObject var viewModel = ProfileViewModel()
	let coordinator: ProfileCoordinator
	
	var body: some View {
		VStack {
			HStack {
				Text(viewModel.user.username)
					.padding([.leading, .top])
					.font(.largeTitle)
				Spacer()
			}
			HStack {
				Text("Date joined: \(viewModel.formmatedDate)")
					.font(.footnote)
					.padding([.horizontal])
				Spacer()
			}
			
			ProfilePostsView(viewModel: ProfilePostsViewModel(profileViewModel: viewModel), coordinator: coordinator)
			
			Spacer()
		}
	}
}
