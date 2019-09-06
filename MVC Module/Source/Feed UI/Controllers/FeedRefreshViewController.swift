//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import UIKit
import FeedFeature

final class FeedRefreshViewController: NSObject {
	@IBOutlet var view: UIRefreshControl?

	var feedLoader: FeedLoader?
	var onRefresh: (([FeedImage]) -> Void)?
	
	@IBAction func refresh() {
		view?.beginRefreshing()
		feedLoader?.load { [weak self] result in
			if let feed = try? result.get() {
				self?.onRefresh?(feed)
			}
			self?.view?.endRefreshing()
		}
	}
}
