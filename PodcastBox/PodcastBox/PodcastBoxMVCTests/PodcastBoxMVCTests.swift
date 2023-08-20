//
//  PodcastBoxMVCTests.swift
//  PodcastBoxMVCTests
//
//  Created by Mete Karakul on 19.08.2023.
//

import XCTest
import Utility
@testable import PodcastBoxAPI
@testable import PodcastBoxMVC

final class PodcastBoxMVCTests: XCTestCase {
    
    private var service: MockService!
    private var view: MockPodcastListView!
    private var controller: PodcastListViewController!
    
    override func setUp() {
        service = MockService()
        view = MockPodcastListView()
        controller = PodcastListViewController()
        
        controller.customView = view
        controller.service = service
    }

    func testPodcastList() throws {
        // Given
        let podcast1 = try ResourceLoader.loadPodcast(resource: .podcast1)
        service.podcasts = [podcast1]
        
        // When
        controller.loadViewIfNeeded()
        
        // Than
        XCTAssertEqual(view.isLoadingValues, [true, false])
        XCTAssertEqual(view.podcastList?.count, 1)
        XCTAssertEqual(try view.podcastList?.element(at: .zero).title, podcast1.name)
    }
}

private final class MockService: TopPodcastServiceProtocol {
    
    var podcasts: [Podcast] = []
    
    func fetchTopPodcast(compilation: @escaping (PodcastBoxAPI.Result<PodcastBoxAPI.TopPodcastResponse>) -> Void) {
        compilation(.success(TopPodcastResponse(result: podcasts)))
    }
}

private final class MockPodcastListView: PodcastListViewProtocol {
    
    var delegate: PodcastListViewDelegate?
    var podcastList: [PodcastPresentation]?
    var isLoadingValues: [Bool] = []
    
    func updatePodcastList(_ podcastList: [PodcastPresentation]) {
        self.podcastList = podcastList
    }
    
    func setLoading(_ isLoading: Bool) {
        isLoadingValues.append(isLoading)
    }
}
