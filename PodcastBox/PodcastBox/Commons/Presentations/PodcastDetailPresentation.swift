//
//  PodcastDetailPresentation.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import Foundation
import PodcastBoxAPI

struct PodcastDetailPresentation: Equatable {
    let title: String
    let artistName: String
    let genre: String
}

extension PodcastDetailPresentation {
    init(podcast: Podcast) {
        self.init(title: podcast.name ?? "-",
                  artistName: podcast.artistName ?? "-",
                  genre: podcast.genres.map({ $0.name ?? "-" }).joined(separator: ", "))
    }
}
