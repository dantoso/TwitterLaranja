import Foundation

struct DatabaseMock {
	
	static var defaultUser = users[usernames[3]]!
	static private var posts: [Post] = createFakePosts()
	
	static private let usernames: [String] = ["alpha", "beta", "teta", "omega"]
	static private let users: [String: User] = [usernames[0]: User(username: usernames[0]),
												usernames[1]: User(username: usernames[1]),
												usernames[2]: User(username: usernames[2]),
												usernames[3]: User(username: usernames[3])]
	

	static private func createFakePosts() -> [Post] {
		let posts = [Post]()
		
//		for i in 0...3 {
//			let userPosts = [Post(author: users[i], content: "hey there"), Post(author: users[i], content: "oh, hi!", mention: <#T##Post?#>)]
//		}
//
		return posts
	}
}
