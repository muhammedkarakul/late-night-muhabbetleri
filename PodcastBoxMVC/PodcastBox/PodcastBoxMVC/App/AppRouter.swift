//
//  AppRouter.swift
//  MovieBox
//
//  Created by Mete Karakul on 13.08.2023.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = PodcastListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
