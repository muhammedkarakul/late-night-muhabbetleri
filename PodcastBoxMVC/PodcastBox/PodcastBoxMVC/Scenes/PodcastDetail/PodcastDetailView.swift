//
//  PodcastDetailView.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import UIKit

final class PodcastDetailView: UIView {
    
    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
}

extension PodcastDetailView: PodcastDetailViewProtocol {
    func updatePodcastDetail(_ podcastDetail: PodcastDetailPresentation) {
        podcastTitleLabel.text = podcastDetail.title
        artistNameLabel.text = podcastDetail.artistName
        genreLabel.text = podcastDetail.genre
    }
}
