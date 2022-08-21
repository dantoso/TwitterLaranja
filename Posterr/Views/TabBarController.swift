import SwiftUI

final class TabBarController: UITabBarController {
	
	lazy var homeCoordinator: HomeCoordinator = HomeCoordinator(navigationController: UINavigationController())
	lazy var profileCoordinator: ProfileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
	
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
	
}
