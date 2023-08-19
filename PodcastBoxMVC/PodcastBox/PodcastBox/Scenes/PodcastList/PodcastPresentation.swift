//
//  PodcastPresentation.swift
//  MovieBox
//
//  Created by Mete Karakul on 12.08.2023.
//

import Foundation
import PodcastBoxAPI

struct PodcastPresentation {
    let title: String
    let detail: String
}

extension PodcastPresentation {
    init(podcast: Podcast) {
        self.init(title: podcast.name ?? "-",
                  detail: podcast.artistName ?? "-")
    }
}
