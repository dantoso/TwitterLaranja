import Foundation

protocol FetchPostsService {
	func fetchAllPosts(completion: @escaping (Result<[Post], PosterrAPIError>) -> Void)
}

protocol UploadPostService {
	func uploadPost(_ post: Post, completion: @escaping (Result<Bool, PosterrAPIError>) -> Void)
}

protocol PosterrServices: UploadPostService, FetchPostsService {}
