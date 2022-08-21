import UIKit

final class PostCreationViewModel: NSObject, UITextViewDelegate {
	
	let textLimit = 777
	weak var author: User!
	var postData = NewPostData()
	
	weak var counterLabel: UILabel?
	weak var postButton: UIButton?
	
	init(author: User) {
		self.author = author
	}
	
	func post() {
		// TODO: implement post
	}
	
	
	//MARK: - TextView Delegate
	func textViewDidChange(_ textView: UITextView) {
		counterLabel?.text = "\(textLimit - textView.text.count)"
		postButton?.isEnabled = textView.text.count > 0
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
