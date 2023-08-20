//
//  TopPodcastResponse.swift
//  PodcastBoxAPI
//
//  Created by Muhammed Karakul on 2.07.2022.
//

import Foundation

public struct TopPodcastResponse: Decodable {
    public let results: [Podcast]
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    init(result: [Podcast]) {
        self.results = result
    }
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Podcast].self, forKey: .results)
    }
}
