//
//  PodcastListViewModel.swift
//  PodcastBoxMVVM
//
//  Created by Mete Karakul on 30.08.2023.
//

import Foundation
import PodcastBoxAPI

final class PodcastListViewModel: PodcastListViewModelProtocol {
    weak var delegate: PodcastListViewModelDelegate?
    private let service: TopPodcastServiceProtocol
    private var podcasts: [Podcast] = []
    
    init(service: TopPodcastServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Podcasts"))
        notify(.setLoading(true))
        
        service.fetchTopPodcast { [weak self] result in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let response):
                self.podcasts = response.results
                let presentations = response.results.map({ PodcastPresentation(podcast: $0) })
                notify(.showPodcastList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectPodcast(at index: Int) {
        let podcast = podcasts[index]
        let viewModel = PodcastDetailViewModel(podcast: podcast)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: PodcastListViewModelOutput) {
        delegate?.handleOutput(output)
    }
}
