//
//  PodcastDetailContract.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import Foundation

protocol PodcastDetailViewDelegate {}

protocol PodcastDetailViewProtocol {
    func updatePodcastDetail(_ podcastDetail: PodcastDetailPresentation)
}
