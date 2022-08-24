import Foundation

struct DatabaseMock {
	
	static var defaultUser: User { users[usernames[3]]! }
	static private var posts: [Post] = createFakePosts()
	
	static private let usernames: [String] = ["alpha", "beta", "teta", "omega"]
	static private let users: [String: User] = [usernames[0]: User(username: usernames[0]),
												usernames[1]: User(username: usernames[1]),
												usernames[2]: User(username: usernames[2]),
												usernames[3]: User(username: usernames[3])]
	
	static private func createFakePosts() -> [Post] {
		var posts = [Post]()
		
		// posting
		for (username, user) in users {
			let post = Post(author: user, content: "hey, I'm \(username)!")
			user.originalPosts.append(post)
			posts.append(post)
		}
		
		// quote posting
		for (username, user) in users {
			let post = Post(author: user, content: "hey \(posts.last!.authorName), I'm \(username)!", mention: posts.last)
			user.quotePosts.append(post)
			posts.append(post)
		}
		
		// reposting a quote post
		let repost = Post(author: defaultUser, content: "", mention: posts[5])
		defaultUser.reposts.append(repost)
		posts.append(repost)
		
		return posts
	}
	
	static func getAllPosts() -> [Post] {
		return posts
	}
	
	static func addPost(_ post: Post, completion: @escaping (Bool) -> Void) {
		guard let user = users[post.authorName] else {
			completion(false)
			return
		}
		
		if post.mention == nil {
			user.originalPosts.append(post)
		}
		else if post.content.isEmpty {
			user.reposts.append(post)
		}
		else {
			user.quotePosts.append(post)
		}
		
		posts.append(post)
		completion(true)
	}
}
