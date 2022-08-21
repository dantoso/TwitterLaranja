import Foundation

struct ProfileViewModel {
	
	private let user: User
	
	var username: String {
		user.username
	}
	var postsMade: [Post] {
		user.postsMade
	}
	var formmatedDate: String = ""
	
	var newPostData = NewPostData()
	
	init(user: User) {
		self.user = user
		formmatedDate = formatDate()
	}
	
	private func formatDate() -> String {
		// TODO: implement correct format
		return user.dateJoined.formatted(date: .long, time: .omitted)
	}
	
}


struct NewPostData {
	var content: String = ""
	var mention: Post? = nil
}
