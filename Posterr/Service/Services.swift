import Foundation

protocol FetchPostsService {
	func fetchAllPosts(completion: @escaping (Result<[Post], Error>) -> Void)
}

protocol UploadPostService {
	func uploadPost(_ post: Post)
}

protocol PosterrServices: UploadPostService, FetchPostsService {}
