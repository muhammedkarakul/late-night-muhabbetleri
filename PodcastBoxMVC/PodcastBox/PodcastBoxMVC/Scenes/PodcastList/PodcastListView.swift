//
//  PodcastListView.swift
//  MovieBox
//
//  Created by Mete Karakul on 12.08.2023.
//

import UIKit

final class PodcastListView: UIView {
    
    weak var delegate: PodcastListViewDelegate?
    private var podcastList: [PodcastPresentation] = []
    @IBOutlet private weak var tableView: UITableView!
}

extension PodcastListView: PodcastListViewProtocol {
    func updatePodcastList(_ podcastList: [PodcastPresentation]) {
        self.podcastList = podcastList
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
}

extension PodcastListView: UITableViewDataSource {
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

extension PodcastListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: indexPath.row)
    }
}
