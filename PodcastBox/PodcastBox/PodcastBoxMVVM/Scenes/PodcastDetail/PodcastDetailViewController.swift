//
//  PodcastDetailViewController.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import UIKit
import PodcastBoxAPI

final class PodcastDetailViewController: UIViewController {
    
    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var viewModel: PodcastDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension PodcastDetailViewController: PodcastDetailViewModelDelegate {
    func showDetail(_ presentation: PodcastDetailPresentation) {
        podcastTitleLabel.text = presentation.title
        artistNameLabel.text = presentation.artistName
        genreLabel.text = presentation.genre
    }
}
