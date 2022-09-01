//
//  ViewController.swift
//  MovieBox
//
//  Created by Muhammed Karakul on 26.06.2022.
//

import UIKit
import MovieBoxAPI

class ViewController: UIViewController {

    let service: TopPodcastServiceProtocol = TopPodcastService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchTopPodcast { result in
            print(result)
        }
        
    }
}

