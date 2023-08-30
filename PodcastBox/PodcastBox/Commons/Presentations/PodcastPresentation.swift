//
//  PodcastPresentation.swift
//  MovieBox
//
//  Created by Mete Karakul on 12.08.2023.
//

import Foundation
import PodcastBoxAPI

final class PodcastPresentation: NSObject {
    let title: String
    let detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? PodcastPresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}

extension PodcastPresentation {
    convenience init(podcast: Podcast) {
        self.init(title: podcast.name ?? "-",
                  detail: podcast.artistName ?? "-")
    }
}
