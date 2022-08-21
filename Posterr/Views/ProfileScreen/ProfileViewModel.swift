import Foundation

struct ProfileViewModel {
	
	let user: User
	var formmatedDate: String = ""
		
	init(user: User) {
		self.user = user
		formmatedDate = formatDate()
	}
	
	private func formatDate() -> String {
		// TODO: implement correct format
		return user.dateJoined.formatted(date: .long, time: .omitted)
	}
	
}
