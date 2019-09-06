//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import UIKit
import FeedFeature

public final class ErrorView: UIView {
	@IBOutlet private var label: UILabel!
	
	public var message: String? {
		get { return isVisible ? label.text : nil }
	}
	
	private var isVisible: Bool {
		return alpha > 0
	}
	
	public override func awakeFromNib() {
		super.awakeFromNib()
		
		label.text = nil
		alpha = 0
	}
	
	func show(message: String) {
		self.label.text = message
		
		UIView.animate(withDuration: 0.25) {
			self.alpha = 1
		}
	}
	
	@IBAction func hideMessage() {
		UIView.animate(
			withDuration: 0.25,
			animations: { self.alpha = 0 },
			completion: { completed in
				if completed { self.label.text = nil }
			})
	}
}

final class FeedRefreshViewController: NSObject {
	@IBOutlet var view: UIRefreshControl?
	@IBOutlet var errorView: ErrorView?

	var feedLoader: FeedLoader?
	var onRefresh: (([FeedImage]) -> Void)?

	@IBAction func refresh() {
		view?.beginRefreshing()
		errorView?.hideMessage()
		feedLoader?.load { [weak self] result in
			do {
				self?.onRefresh?(try result.get())
			} catch {
				self?.errorView?.show(message: Localized.feedLoadError)
			}
			self?.view?.endRefreshing()
		}
	}
}
