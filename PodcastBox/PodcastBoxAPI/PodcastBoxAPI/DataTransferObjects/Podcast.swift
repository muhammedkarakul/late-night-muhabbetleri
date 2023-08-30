//
//  Movie.swift
//  PodcastBoxAPI
//
//  Created by Muhammed Karakul on 26.06.2022.
//

import Foundation

public struct Podcast: Decodable {
    public let artistName: String?
    public let name: String?
    public let artwork: URL?
    public let genres: [Genre]
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case name
        case artwork = "artworkUrl100"
        case genres
    }
}
