import Foundation

final class User: Codable {
	
	let username: String
	let dateJoined: Date
	
	var postsMade: [Post]
	
	init(username: String) {
		self.username = username
		self.dateJoined = Date()
		self.postsMade = []
	}
}
