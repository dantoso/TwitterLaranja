import SwiftUI

final class ProfileCoordinator: PostWriterCoordinator {
	
	var childCoordinators: [Coordinator] = []
	var navigationController: UINavigationController
	let profileViewModel = ProfileViewModel()
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let profileVC = createProfileVC()
		navigationController.pushViewController(profileVC, animated: false)
	}
	
	private func createProfileVC() -> UIHostingController<ProfileView> {
		let profileVC = UIHostingController(rootView: ProfileView(viewModel: profileViewModel, coordinator: self))
		profileVC.title = "Profile"
		profileVC.tabBarItem.image = UIImage(systemName: "person")

		return profileVC
	}
	
	func dismissPostCreationViewController(_ viewController: PostCreationViewController) {
		profileViewModel.user = DatabaseMock.defaultUser
		viewController.dismiss(animated: true)
	}
	
}
