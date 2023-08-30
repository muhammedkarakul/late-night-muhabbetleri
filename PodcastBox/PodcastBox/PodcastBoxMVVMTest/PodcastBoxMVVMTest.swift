//
//  PodcastBoxMVCTests.swift
//  PodcastBoxMVCTests
//
//  Created by Mete Karakul on 19.08.2023.
//

import XCTest
import Utility
@testable import PodcastBoxAPI
@testable import PodcastBoxMVVM

final class PodcastBoxMVVMTest: XCTestCase {
    
    private var view: MockView!
    private var viewModel: PodcastListViewModel!
    private var service: MockService!
    
    override func setUp() {
        service = MockService()
        viewModel = PodcastListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }

    func testLoad() throws {
        // Given
        let podcast1 = try ResourceLoader.loadPodcast(resource: .podcast1)
        let podcast2 = try ResourceLoader.loadPodcast(resource: .podcast2)
        service.podcasts = [podcast1, podcast2]
        
        // When
        viewModel.load()
        
        // Then
        XCTAssertEqual(view.outputs.count, 4)
        
        switch try view.outputs.element(at: 0) {
        case .updateTitle(_):
            break // Success!
        default:
            XCTFail("First output should be 'updateTitle'.")
        }
        
        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2), .setLoading(false))
        
        let expectedPodcasts = [podcast1, podcast2].map({ PodcastPresentation(podcast: $0) })
        XCTAssertEqual(try view.outputs.element(at: 3), .showPodcastList(expectedPodcasts))
    }
    
    func testNavigation() throws {
        // Given
        let podcast1 = try ResourceLoader.loadPodcast(resource: .podcast1)
        let podcast2 = try ResourceLoader.loadPodcast(resource: .podcast2)
        service.podcasts = [podcast1, podcast2]
        viewModel.load()
        view.reset()
        
        // When
        viewModel.selectPodcast(at: .zero)
        
        // Then
        XCTAssertTrue(view.isDetailRouteCalled)
    }
}

private final class MockService: TopPodcastServiceProtocol {
    
    var podcasts: [Podcast] = []
    
    func fetchTopPodcast(compilation: @escaping (PodcastBoxAPI.Result<PodcastBoxAPI.TopPodcastResponse>) -> Void) {
        compilation(.success(TopPodcastResponse(result: podcasts)))
    }
}

private final class MockView: PodcastListViewModelDelegate {

    var outputs: [PodcastListViewModelOutput] = []
    var isDetailRouteCalled: Bool = false
    
    func reset() {
        outputs.removeAll()
        isDetailRouteCalled = false
    }
    
    func handleOutput(_ output: PodcastBoxMVVM.PodcastListViewModelOutput) {
        outputs.append(output)
    }
    
    func navigate(to route: PodcastBoxMVVM.PodcastListViewRoute) {
        switch route {
        case .detail:
            isDetailRouteCalled = true
        }
    }
}
