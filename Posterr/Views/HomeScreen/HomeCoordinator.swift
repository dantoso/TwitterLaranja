import SwiftUI

final class HomeCoordinator: PostWriterCoordinator {
	
	var childCoordinators: [Coordinator] = []
	var navigationController: UINavigationController
	let homeViewModel = HomeViewModel()
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let homeVC = createHomeVC()
		navigationController.pushViewController(homeVC, animated: false)
	}
	
	private func createHomeVC() -> UIHostingController<HomeView> {
		let homeVC = UIHostingController(rootView: HomeView(viewModel: homeViewModel, coordinator: self))
		homeVC.title = "Home"
		homeVC.tabBarItem.image = UIImage(systemName: "house")

		return homeVC
	}
	
	func updatePostFeed() {
		homeViewModel.startFetchPosts()
	}
	
}
