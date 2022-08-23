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
	func dismissPostCreationViewController(_ viewController: PostCreationViewController)
	
}

extension PostWriterCoordinator {
	
	func writePost(withAuthor author: User) {
		let viewModel = PostCreationViewModel(author: author)
		let writePostVC = PostCreationViewController(viewModel: viewModel, coordinator: self)
		
		navigationController.present(writePostVC, animated: true)
	}
	
	func writeRepost(withAuthor author: User, mentioning post: Post) {
		
		let viewModel = PostCreationViewModel(author: author, mention: post)
		
		let alert = UIAlertController(title: "Repost confirmation",
									  message: "Do you want to repost \(post.authorName)'s post?",
									  preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Repost", style: .default, handler: { _ in
			viewModel.post()
		}))
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		
		navigationController.present(alert, animated: true)
	}
	
	func writeQuotePost(withAuthor author: User, mentioning post: Post) {
		let viewModel = PostCreationViewModel(author: author, mention: post)
		let writePostVC = PostCreationViewController(viewModel: viewModel, coordinator: self)
		
		navigationController.present(writePostVC, animated: true)
	}
	
}
