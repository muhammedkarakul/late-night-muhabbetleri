//
//  AppContainer.swift
//  MovieBox
//
//  Created by Mete Karakul on 13.08.2023.
//

import Foundation
import PodcastBoxAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopPodcastService()
}
