//
//  PodcastDetailBuilder.swift
//  PodcastBox
//
//  Created by Mete Karakul on 19.08.2023.
//

import UIKit
import PodcastBoxAPI

final class PodcastDetailBuilder {
    
    static func make(with viewModel: PodcastDetailViewModelProtocol) -> PodcastDetailViewController {
        let storyboard = UIStoryboard(name: "PodcastDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PodcastDetailViewController") as! PodcastDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
