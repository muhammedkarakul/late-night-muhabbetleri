//
//  PodcastListContract.swift
//  MovieBox
//
//  Created by Mete Karakul on 7.08.2023.
//

import Foundation

@objc protocol PodcastListViewProtocol {
    var delegate: PodcastListViewDelegate? { get set }
    func updatePodcastList(_ podcastList: [PodcastPresentation])
    func setLoading(_ isLoading: Bool)
}

@objc protocol PodcastListViewDelegate: AnyObject {
    func didSelectMovie(at index: Int)
}
