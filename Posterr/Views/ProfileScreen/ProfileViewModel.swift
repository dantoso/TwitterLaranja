import Foundation

final class ProfileViewModel: ObservableObject {
	
	@Published var user: User?
	@Published var failedFetch = false
	@Published var formmatedDate: String = ""
	
	private var username: String
	private let service: UserFetchService
		
	init(username: String, service: UserFetchService = PosterrAPI()) {
		self.username = username
		self.service = service
	}
	
	func fetchUser() {
		service.fetchUserData(username: username) { [weak self] result in
			switch result {
			case .success(let user):
				self?.user = user
				
			case .failure(let error):
				// TODO: Handle error
				self?.failedFetch = true
				print(error.localizedDescription)
			}
		}
	}
	
	private func formatDate(_ date: Date) -> String {
		// TODO: implement correct format
		return date.formatted(date: .long, time: .omitted)
	}
	
}
