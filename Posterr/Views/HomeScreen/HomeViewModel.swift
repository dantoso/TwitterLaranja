import Foundation

final class HomeViewModel: ObservableObject {
	
	@Published var posts: [Post]? = nil
	@Published var fetchFailed = false
	
	let service: FetchPostsService
	
	init(service: FetchPostsService = PosterrAPIService()) {
		self.service = service
	}
	
	func startFetchPosts() {
		service.fetchAllPosts { [weak self] result in
			switch result {
			case .success(let posts):
				self?.posts = posts
				
			case .failure(let error):
				// TODO: Handle errors
				self?.fetchFailed = true
				print(error.localizedDescription)
			}
		}
	}
	
}
