//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import XCTest
import MVC
import FeediOSApp

final class AlwaysFailingLoaderTests: XCTestCase {
	
	func test_loadFeed_alwaysFails() {
		let sut = AlwaysFailingLoader()
		let exp = expectation(description: "Wait for load completion")
		
		sut.load { (result: MVC.FeedLoader.Result) in
			switch result {
			case .success: XCTFail("Expected failure, got \(result) instead")
			default: break
			}
			
			exp.fulfill()
		}
		
		wait(for: [exp], timeout: 1.0)
	}
	
	func test_loadFeedImage_alwaysFails() {
		let sut = AlwaysFailingLoader()
		let exp = expectation(description: "Wait for load completion")
		let url = URL(string: "http://any-url.com")!
		
		let _: MVC.FeedImageDataLoaderTask = sut.loadImageData(from: url) { (result: MVC.FeedImageDataLoader.Result) in
			switch result {
			case .success: XCTFail("Expected failure, got \(result) instead")
			default: break
			}
			
			exp.fulfill()
		}
		
		wait(for: [exp], timeout: 1.0)
	}

}
