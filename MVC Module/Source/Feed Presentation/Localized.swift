//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import Foundation

final class Localized {
	static var feedTitle: String {
		return NSLocalizedString("FEED_VIEW_TITLE",
			tableName: "Feed",
			bundle: Bundle(for: Localized.self),
			comment: "Title for the feed view")
	}
}
