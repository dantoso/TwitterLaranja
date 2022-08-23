import Foundation

final class User: Codable {
	let username: String
	let dateJoined: Date
	
	var reposts: [Post]
	var quotePosts: [Post]
	var originalPosts: [Post]
	
	init(username: String, originalPosts: [Post] = [], reposts: [Post] = [], quotePosts: [Post] = []) {
		self.username = username
		self.dateJoined = Date()
		self.originalPosts = originalPosts
		self.reposts = reposts
		self.quotePosts = quotePosts
	}
}
