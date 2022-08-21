import UIKit

final class PostCreationViewModel: NSObject, UITextViewDelegate {
	
	weak var author: User!
	let textLimit = 777
	
	var postData = NewPostData()
	weak var counterLabel: UILabel?
	
	init(author: User) {
		self.author = author
	}
	
	func textViewDidChange(_ textView: UITextView) {
		counterLabel?.text = "\(textLimit - textView.text.count)"
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		return textView.text.count + text.count <= textLimit
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		postData.content = textView.text
	}
}



struct NewPostData {
	var content: String = ""
	var mention: Post? = nil
}
