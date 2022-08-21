import SwiftUI

final class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let profileVC = createProfileVC()
		let homeVC = createHomeVC()

		setViewControllers([homeVC, profileVC], animated: false)
		setupTabBar()
	}
	
	func setupTabBar() {
		tabBar.isTranslucent = false
		tabBar.backgroundColor = .systemGray6
		tabBar.tintColor = .systemOrange
	}
	
	func createHomeVC() -> UIHostingController<HomeView> {
		let homeVC = UIHostingController(rootView: HomeView())
		homeVC.title = "Home"
		homeVC.tabBarItem.image = UIImage(systemName: "house")
		
		return homeVC
	}
	
	func createProfileVC() -> UIHostingController<ProfileView> {
		let profileVC = UIHostingController(rootView: ProfileView())
		profileVC.title = "Profile"
		profileVC.tabBarItem.image = UIImage(systemName: "person")

		return profileVC
	}
}
