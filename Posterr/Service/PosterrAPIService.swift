import Foundation

struct PosterrAPIService: PosterrServices {
	
	func uploadPost(_ post: Post) {
		//TODO: implement api upload
		DatabaseMock.addPost(post)
	}
	
	func fetchAllPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
		//TODO: implement api request
		let posts = DatabaseMock.getAllPosts()
		completion(.success(posts))
	}
	
}
