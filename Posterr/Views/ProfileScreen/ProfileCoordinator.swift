import SwiftUI

final class ProfileCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let profileVC = createProfileVC()
		navigationController.pushViewController(profileVC, animated: false)
	}
	
	private func createProfileVC() -> UIHostingController<ProfileView> {
		let user = User(username: "Alpha")
		let viewModel = ProfileViewModel(user: user)
		
		let profileVC = UIHostingController(rootView: ProfileView(viewModel: viewModel, coordinator: self))
		profileVC.title = "Profile"
		profileVC.tabBarItem.image = UIImage(systemName: "person")

		return profileVC
	}
	
}
