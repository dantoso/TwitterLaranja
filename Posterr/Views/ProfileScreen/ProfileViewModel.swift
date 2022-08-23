import Foundation

final class ProfileViewModel: ObservableObject {
	
	@Published var user: User
	lazy var formmatedDate: String = formatDate(user.dateJoined)
			
	init(user: User) {
		self.user = user
	}
	
	private func formatDate(_ date: Date) -> String {
		// TODO: implement correct format
		return date.formatted(date: .long, time: .omitted)
	}
	
}
