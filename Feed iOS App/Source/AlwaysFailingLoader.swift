//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import Foundation
import MVP
import MVVM
import MVC

public final class AlwaysFailingLoader {
	public init() {}
}

extension AlwaysFailingLoader: MVC.FeedLoader, MVVM.FeedLoader, MVP.FeedLoader {
	private struct LoadError: Error {}
	
	public func load(completion: @escaping (MVC.FeedLoader.Result) -> Void) {
		completion(.failure(LoadError()))
	}
	
	public func load(completion: @escaping (MVVM.FeedLoader.Result) -> Void) {
		completion(.failure(LoadError()))
	}

	public func load(completion: @escaping (MVP.FeedLoader.Result) -> Void) {
		completion(.failure(LoadError()))
	}
}
	
extension AlwaysFailingLoader: MVC.FeedImageDataLoader, MVVM.FeedImageDataLoader, MVP.FeedImageDataLoader {
	private final class Task: MVC.FeedImageDataLoaderTask, MVVM.FeedImageDataLoaderTask, MVP.FeedImageDataLoaderTask {
		func cancel() {}
	}
	
	public func loadImageData(from url: URL, completion: @escaping (MVC.FeedImageDataLoader.Result) -> Void) -> MVC.FeedImageDataLoaderTask {
		completion(.failure(LoadError()))
		return Task()
	}
	
	public func loadImageData(from url: URL, completion: @escaping (MVVM.FeedImageDataLoader.Result) -> Void) -> MVVM.FeedImageDataLoaderTask {
		completion(.failure(LoadError()))
		return Task()
	}

	public func loadImageData(from url: URL, completion: @escaping (MVP.FeedImageDataLoader.Result) -> Void) -> MVP.FeedImageDataLoaderTask {
		completion(.failure(LoadError()))
		return Task()
	}
}
