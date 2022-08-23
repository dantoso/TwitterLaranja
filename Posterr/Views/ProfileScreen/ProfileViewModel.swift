import Foundation

final class ProfileViewModel: ObservableObject {
	
	@Published var user: User
	lazy var formmatedDate: String = formatDate(user.dateJoined)
			
	init(user: User = DatabaseMock.defaultUser) {
		self.user = user
	}
	
	private func formatDate(_ date: Date) -> String {
		// TODO: implement correct format: "Month day, year"
		return date.formatted(date: .long, time: .omitted)
	}
	
}
