//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import Foundation
import FeedFeature

public final class AlwaysFailingLoader {
	public init() {}
}

extension AlwaysFailingLoader: FeedLoader {
	private struct LoadError: Error {}
	
	public func load(completion: @escaping (FeedLoader.Result) -> Void) {
		completion(.failure(LoadError()))
	}
}
	
extension AlwaysFailingLoader: FeedImageDataLoader {
	private final class Task: FeedImageDataLoaderTask {
		func cancel() {}
	}
	
	public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
		completion(.failure(LoadError()))
		return Task()
	}
}
