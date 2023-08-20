//
//  ResourceLoader.swift
//  PodcastBox
//
//  Created by Mete Karakul on 20.08.2023.
//

import Foundation
import Utility
import PodcastBoxAPI

final class ResourceLoader {
    
    enum PodcastResources: String {
        case podcast1
        case podcast2
        case podcast3
    }

    static func loadPodcast(resource: PodcastResources) throws -> Podcast {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrapped
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let podcast = try decoder.decode(Podcast.self, from: data)
        return podcast
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
