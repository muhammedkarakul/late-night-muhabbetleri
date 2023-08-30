//
//  PodcastListViewController.swift
//  MovieBox
//
//  Created by Mete Karakul on 12.08.2023.
//

import UIKit
import PodcastBoxAPI

final class PodcastListViewController: UIViewController {
    @IBOutlet weak var customView: PodcastListViewProtocol! {
        didSet {
            customView.delegate = self
        }
    }
    var service: TopPodcastServiceProtocol!
    private var podcastList: [Podcast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Podcasts"
        customView.setLoading(true)
        service.fetchTopPodcast { [weak self] result in
            guard let self = self else {
                return
            }
            self.customView.setLoading(false)
            switch result {
            case .success(let value):
                self.podcastList = value.results
                let podcastPresentations = value.results.map(PodcastPresentation.init)
                self.customView.updatePodcastList(podcastPresentations)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PodcastListViewController: PodcastListViewDelegate {
    func didSelectMovie(at index: Int) {
        let podcast = podcastList[index]
        let podcastDetailViewController = PodcastDetailBuilder.make(with: podcast)
        navigationController?.pushViewController(podcastDetailViewController, animated: true)
    }
}
