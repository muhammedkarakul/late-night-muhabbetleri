//
//  PodcastListContract.swift
//  MovieBox
//
//  Created by Mete Karakul on 7.08.2023.
//

import Foundation

protocol PodcastListViewModelProtocol {
    var delegate: PodcastListViewModelDelegate? { get set }
    func load()
    func selectPodcast(at index: Int)
}

enum PodcastListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showPodcastList([PodcastPresentation])
}

enum PodcastListViewRoute {
    case detail(PodcastDetailViewModelProtocol)
}

protocol PodcastListViewModelDelegate: AnyObject {
    func handleOutput(_ output: PodcastListViewModelOutput)
    func navigate(to route: PodcastListViewRoute)
}
