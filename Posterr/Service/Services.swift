import Foundation

protocol UserFetchService {
	func fetchUserData(username: String, completion: @escaping (Result<[User], Error>) -> Void)
}

protocol PostFetchService {
	func fetchAllPosts(completion: @escaping (Result<[User], Error>) -> Void)
}

protocol PostService {
	func post(_ post: Post, completion: @escaping (Result<[User], Error>) -> Void)
}

protocol PosterrService: PostService, UserFetchService, PostFetchService {}
