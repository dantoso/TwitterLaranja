import SwiftUI

final class HomeCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let homeVC = createHomeVC()
		navigationController.pushViewController(homeVC, animated: false)
	}
	
	private func createHomeVC() -> UIHostingController<HomeView> {
		let homeVC = UIHostingController(rootView: HomeView(coordinator: self))
		homeVC.title = "Home"
		homeVC.tabBarItem.image = UIImage(systemName: "house")

		return homeVC
	}
	
}
