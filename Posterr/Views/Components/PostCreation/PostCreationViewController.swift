import UIKit

final class PostCreationViewController: UIViewController {
	
	var viewModel: PostCreationViewModel
	private lazy var textView: UITextView = createTextView()
	private lazy var counterLabel: UILabel = createCounterLabel()
	
	init(viewModel: PostCreationViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		title = "New Post"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		textView.isScrollEnabled = true
		textView.becomeFirstResponder()
		viewModel.counterLabel = counterLabel
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
		return view
	}
	
	//MARK: - Adding subviews
	private func addSubviews() {
		
		view.addSubview(textView)
		view.addSubview(counterLabel)
		
		counterLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
							right: view.rightAnchor,
							paddingTop: 20,
							paddingRight: 20)
		
		
		textView.anchor(top: counterLabel.bottomAnchor,
						left: view.leftAnchor,
						bottom: view.safeAreaLayoutGuide.bottomAnchor,
						right: view.rightAnchor,
						paddingTop: 10,
						paddingLeft: 10,
						paddingRight: 10)
	}
	
	private func addPostButton() {
		
	}
	

	//MARK: - required init
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
