//
//  PodcastDetailViewModel.swift
//  PodcastBoxMVVM
//
//  Created by Mete Karakul on 30.08.2023.
//

import Foundation
import PodcastBoxAPI

final class PodcastDetailViewModel: PodcastDetailViewModelProtocol {
    
    weak var delegate: PodcastDetailViewModelDelegate?
    
    private let presentation: PodcastDetailPresentation
    
    init(podcast: Podcast) {
        self.presentation = PodcastDetailPresentation(podcast: podcast)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
