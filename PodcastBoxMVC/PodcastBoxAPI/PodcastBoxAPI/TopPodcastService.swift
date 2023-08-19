//
//  TopPodcastService.swift
//  PodcastBoxAPI
//
//  Created by Muhammed Karakul on 2.07.2022.
//

import Foundation
import Alamofire

public protocol TopPodcastServiceProtocol {
    func fetchTopPodcast(compilation: @escaping (Result<TopPodcastResponse>) -> Void)
}

public class TopPodcastService: TopPodcastServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internalError: Swift.Error)
        case networkError(internalError: Swift.Error)
    }
    
    public init() { }
    
    public func fetchTopPodcast(compilation: @escaping (Result<TopPodcastResponse>) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/podcasts/top/10/podcasts.json"
        AF.request(urlString).response { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    guard let data = data else {
                        return
                    }
                    let response = try decoder.decode(TopPodcastResponse.self, from: data)
                    compilation(.success(response))
                } catch {
                    compilation(.failure(Error.serializationError(internalError: error)))
                }
            case .failure(let error):
                compilation(.failure(Error.networkError(internalError: error)))
            }
        }
    }
}
