import UIKit

protocol Coordinator {
	var childCoordinators: [Coordinator] {get set}
	var navigationController: UINavigationController {get set}

	func start()
}

protocol PostWriterCoordinator: Coordinator {
	func writePost(withAuthor author: User)
	func writeRepost(withAuthor author: User, mentioning post: Post)
	func writeQuotePost(withAuthor author: User, mentioning post: Post)
	
}

extension PostWriterCoordinator {
	
	func writePost(withAuthor author: User) {
		let viewModel = PostCreationViewModel(author: author)
		let writePostVC = PostCreationViewController(viewModel: viewModel)
		
		navigationController.present(writePostVC, animated: true)
	}
	
	func writeRepost(withAuthor author: User, mentioning post: Post) {
		let viewModel = PostCreationViewModel(author: author, mention: post)
		let writePostVC = PostCreationViewController(viewModel: viewModel)
		
		navigationController.present(writePostVC, animated: true)
	}
	
	func writeQuotePost(withAuthor author: User, mentioning post: Post) {
		let viewModel = PostCreationViewModel(author: author, mention: post)
		let writePostVC = PostCreationViewController(viewModel: viewModel)
		
		navigationController.present(writePostVC, animated: true)
	}
	
}
