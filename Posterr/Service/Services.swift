import Foundation

protocol PostFetchService {
	func fetchAllPosts(completion: @escaping (Result<[Post], Error>) -> Void)
}

protocol PostService {
	func uploadPost(_ post: Post)
}

protocol PosterrServices: PostService, PostFetchService {}
