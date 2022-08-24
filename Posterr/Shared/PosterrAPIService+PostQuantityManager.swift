import Foundation

extension PosterrAPIService {
	
	struct PostQuantityManager {
		
		private static let postsMadeTodayKey = "timesPostedToday"
		private static var postsMadeToday: Int {
			get {
				UserDefaults.standard.integer(forKey: postsMadeTodayKey)
			}
			set {
				UserDefaults.standard.set(newValue, forKey: postsMadeTodayKey)
			}
		}
		
		private static let lastPostDateKey = "lastPostDate"
		private static var lastPostDate: [Int] {
			get {
				UserDefaults.standard.array(forKey: lastPostDateKey) as! [Int]
			}
			set {
				UserDefaults.standard.set(newValue, forKey: lastPostDateKey)
			}
		}
		
		static func getTimesPostedToday() -> Int {
			let today = convertCurrentDateToArray()
					
			if lastPostDate == today {
				return postsMadeToday
			}
			else {
				return 0
			}
		}
		
		static func incrementPostsMadeToday() {
			let today = convertCurrentDateToArray()
			if today == lastPostDate {
				postsMadeToday += 1
			}
			else {
				lastPostDate = today
				postsMadeToday = 1
			}
		}
		
		private static func convertCurrentDateToArray() -> [Int] {
			let today = Calendar.current.dateComponents([.day, .month, .year], from: Date())
			
			return [today.day!, today.month!, today.year!]
		}
	}

	
}

