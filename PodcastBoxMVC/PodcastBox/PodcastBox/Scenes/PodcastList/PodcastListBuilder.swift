//
//  PodcastListBuilder.swift
//  MovieBox
//
//  Created by Mete Karakul on 13.08.2023.
//

import UIKit

final class PodcastListBuilder {
    static func make() -> PodcastListViewController {
        let storyboard = UIStoryboard(name: "PodcastList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PodcastListViewController") as! PodcastListViewController
        viewController.service = app.service
        return viewController
    }
}
