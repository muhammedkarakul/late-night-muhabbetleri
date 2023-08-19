//
//  PodcastDetailViewController.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import UIKit
import PodcastBoxAPI

final class PodcastDetailViewController: UIViewController {
    
    @IBOutlet private weak var customView: PodcastDetailView!
    
    var podcast: Podcast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let podcast = podcast else {
            return
        }
        let podcastDetailPresentation = PodcastDetailPresentation(podcast: podcast)
        customView.updatePodcastDetail(podcastDetailPresentation)
    }
}
