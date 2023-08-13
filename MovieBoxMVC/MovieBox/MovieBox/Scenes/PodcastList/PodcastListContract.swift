//
//  PodcastListContract.swift
//  MovieBox
//
//  Created by Mete Karakul on 7.08.2023.
//

import Foundation

protocol PodcastListViewProtocol {
    func updatePodcastList(_ podcastList: [PodcastPresentation])
    func setLoading(_ isLoading: Bool)
}
