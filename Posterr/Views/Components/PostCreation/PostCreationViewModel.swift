import UIKit

final class PostCreationViewModel: NSObject, UITextViewDelegate {
	
	let textLimit = 777
	weak var author: User!
	var postData = NewPostData()
	weak var counterLabel: UILabel?
	weak var postButton: UIButton?
	
	init(author: User, mention: Post? = nil) {
		self.author = author
		self.postData.mention = mention
	}
	
	func post() {
		// TODO: implement post
//		let post = Post(author: author, content: postData.content, mention: postData.mention)
	}
	
	
	//MARK: - TextView Delegate
	func textViewDidChange(_ textView: UITextView) {
		counterLabel?.text = "\(textLimit - textView.text.count)"
		postButton?.isEnabled = textView.text.count > 0
		postData.content = textView.text
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		return textView.text.count + text.count <= textLimit
	}
}



struct NewPostData {
	var content: String = ""
	var mention: Post? = nil
}
