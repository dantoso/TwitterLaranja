import SwiftUI

final class TabBarController: UITabBarController {
	
	lazy var homeCoordinator: HomeCoordinator = HomeCoordinator(navigationController: createNavController())
	lazy var profileCoordinator: ProfileCoordinator = ProfileCoordinator(navigationController: createNavController())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		homeCoordinator.start()
		profileCoordinator.start()
		
		setViewControllers([homeCoordinator.navigationController, profileCoordinator.navigationController], animated: false)
		setupTabBar()
	}
	
	func setupTabBar() {
		tabBar.isTranslucent = false
		tabBar.backgroundColor = .systemGray6
		tabBar.tintColor = .systemOrange
	}
	
	func createNavController() -> UINavigationController {
		let navVC = UINavigationController()
		navVC.navigationBar.tintColor = .systemOrange
		
		return navVC
	}
	
}
