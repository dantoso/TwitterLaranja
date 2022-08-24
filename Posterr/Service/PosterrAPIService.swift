import Foundation

struct PosterrAPIService: PosterrServices {
	
	private static var timesPosted: Int = 0
	
	func uploadPost(_ post: Post, completion: @escaping (Result<Bool, PosterrAPIError>) -> Void) {
		
		guard PosterrAPIService.timesPosted < 5 else {
			completion(.failure(PosterrAPIError.exceeding5PostsPerDay))
			return
		}
		
		DatabaseMock.addPost(post) { isPostStored in
			if isPostStored {
				PosterrAPIService.timesPosted += 1
			}
		}
		
	}
	
	func fetchAllPosts(completion: @escaping (Result<[Post], PosterrAPIError>) -> Void) {
		let posts = DatabaseMock.getAllPosts()
		completion(.success(posts))
	}
	
}

