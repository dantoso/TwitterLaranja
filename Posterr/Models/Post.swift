import Foundation

final class Post: Codable {
	let authorName: String
	let content: String
	let mention: Post?
	
	init(author: User, content: String, mention: Post? = nil) {
		self.authorName = author.username
		self.content = content
		self.mention = mention
	}
}
