//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import UIKit
import FeedFeature

public final class ErrorView: UIView {
	@IBOutlet private var label: UILabel!
	
	public var message: String? {
		get { return label.text }
	}
	
	public override func awakeFromNib() {
		super.awakeFromNib()
		
		label.text = nil
	}
	
	func show(message: String) {
		label.text = message
	}
	
	func hideMessage() {
		label.text = nil
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
