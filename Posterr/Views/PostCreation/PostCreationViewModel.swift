import UIKit

final class PostCreationViewModel: NSObject, UITextViewDelegate {
	
	let textLimit = 777
	private weak var author: User!
	private var postData = NewPostData()
	private var service: PostService
	
	weak var counterLabel: UILabel?
	weak var postButton: UIButton?
	
	init(author: User, mention: Post? = nil, service: PostService = PosterrAPI()) {
		self.author = author
		self.postData.mention = mention
		self.service = service
	}
	
	func post() {
		let newPost = Post(author: author, content: postData.content, mention: postData.mention)
		service.post(newPost)
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
