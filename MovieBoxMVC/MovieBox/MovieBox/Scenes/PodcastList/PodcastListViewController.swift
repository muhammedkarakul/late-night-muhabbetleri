//
//  PodcastListViewController.swift
//  MovieBox
//
//  Created by Mete Karakul on 12.08.2023.
//

import UIKit
import MovieBoxAPI

final class PodcastListViewController: UIViewController {
    @IBOutlet private weak var customView: PodcastListView!
    var service: TopPodcastServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.setLoading(true)
        service.fetchTopPodcast { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let value):
                let podcastPresentations = value.results.map(PodcastPresentation.init)
                self.customView.updatePodcastList(podcastPresentations)
            case .failure(let error):
                print(error)
            }
        }
    }
}
