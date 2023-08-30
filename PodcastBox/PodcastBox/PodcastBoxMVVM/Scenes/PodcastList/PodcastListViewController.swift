//
//  PodcastListViewController.swift
//  MovieBox
//
//  Created by Mete Karakul on 12.08.2023.
//

import UIKit
import PodcastBoxAPI

final class PodcastListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: PodcastListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    private var podcastList: [PodcastPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension PodcastListViewController: PodcastListViewModelDelegate {
    func handleOutput(_ output: PodcastListViewModelOutput) {
        
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showPodcastList(let podcastList):
            self.podcastList = podcastList
            tableView.reloadData()
        }
    }
    
    func navigate(to route: PodcastListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = PodcastDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension PodcastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectPodcast(at: indexPath.row)
    }
}

extension PodcastListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcastList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastListCell", for: indexPath)
        let podcast = podcastList[indexPath.row]
        cell.textLabel?.text = podcast.title
        cell.detailTextLabel?.text = podcast.detail
        return cell
    }
}
