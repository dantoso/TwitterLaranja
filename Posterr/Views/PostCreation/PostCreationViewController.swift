import UIKit

final class PostCreationViewController: UIViewController {
	
	var viewModel: PostCreationViewModel
	let coordinator: PostWriterCoordinator
	
	private lazy var postButton: UIButton = createPostButton()
	private lazy var textView: UITextView = createTextView()
	private lazy var counterLabel: UILabel = createCounterLabel()
	
	init(viewModel: PostCreationViewModel, coordinator: PostWriterCoordinator) {
		self.coordinator = coordinator
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		title = "New Post"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		addSubviews()
		
		viewModel.counterLabel = counterLabel
		viewModel.postButton = postButton
		
		textView.isUserInteractionEnabled = true
		textView.isScrollEnabled = true
		textView.becomeFirstResponder()
	}
	
	//MARK: - Subview creation
	private func createTextView() -> UITextView {
		let view = UITextView()
		view.delegate = viewModel
		view.tintColor = .systemOrange
		view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		
		return view
	}
	
	private func createCounterLabel() -> UILabel {
		let view = UILabel()
		view.text = "\(viewModel.textLimit - textView.text.count)"
		view.font = UIFont.systemFont(ofSize: 14)
		view.textColor = .systemGray
		
		return view
	}
	
	private func createPostButton() -> UIButton {
		let postBtn = UIButton()
		
		postBtn.setTitle("Post", for: .normal)
		postBtn.setTitleColor(.systemOrange, for: .normal)
		postBtn.setTitleColor(.systemGray, for: .disabled)
		postBtn.tintColor = .systemOrange
		
		postBtn.isEnabled = false
		postBtn.addTarget(self, action: #selector(didTapPost), for: .touchUpInside)
		
		return postBtn
	}
	
	//MARK: - Adding subviews
	private func addSubviews() {
		
		view.addSubview(postButton)
		view.addSubview(textView)
		view.addSubview(counterLabel)
		
		postButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
						  right: view.rightAnchor,
						  paddingTop: 10,
						  paddingRight: 20)
		
		counterLabel.anchor(top: postButton.bottomAnchor,
							right: view.rightAnchor,
							paddingTop: 20,
							paddingRight: 20)
		
		
		textView.anchor(top: counterLabel.bottomAnchor,
						left: view.leftAnchor,
						bottom: view.centerYAnchor,
						right: view.rightAnchor,
						paddingTop: 10,
						paddingLeft: 10,
						paddingRight: 10)
		
	}
	//MARK: - Button action
	@objc func didTapPost() {
		viewModel.post()
		coordinator.dismissPostCreationViewController(self)
	}
	

	//MARK: - required init
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
