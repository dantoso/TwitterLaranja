import Foundation

final class User: Codable {
	let username: String
	let dateJoined: Date
	
	var repostsMade: [Post]
	var quotePostsMade: [Post]
	var originalPostsMade: [Post]
	
	init(username: String, originalPosts: [Post] = [], reposts: [Post] = [], quotePosts: [Post] = []) {
		self.username = username
		self.dateJoined = Date()
		self.originalPostsMade = originalPosts
		self.repostsMade = reposts
		self.quotePostsMade = quotePosts
	}
}
