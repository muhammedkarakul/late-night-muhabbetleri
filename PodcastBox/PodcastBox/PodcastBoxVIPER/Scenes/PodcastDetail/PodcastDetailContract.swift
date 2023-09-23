//
//  PodcastDetailContract.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import Foundation

protocol PodcastDetailViewModelProtocol {
    var delegate: PodcastDetailViewModelDelegate? { get set }
    func load()
}

protocol PodcastDetailViewModelDelegate: AnyObject {
    func showDetail(_ presentation: PodcastDetailPresentation)
}
