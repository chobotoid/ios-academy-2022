//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Marek Slávik on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import UIKit
import SwiftUI

final class EpisodesCoordinator {
    let container: Container

    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = RMNavigationController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: NavigationControllerCoordinator
extension EpisodesCoordinator: NavigationControllerCoordinator {
    func start() {
        navigationController.setViewControllers([createEpisodesListView()], animated: false)
    }
    
    func createEpisodesListView() -> UIViewController {
        UIHostingController(rootView: EpisodesListView(coordinator: self))
    }
    
    func createWebView(url: URL) -> UIViewController {
        let webView = WebView(url: url)
        
        return UIHostingController(rootView: webView)
    }
}

// MARK: Episodes List View Event Handling
extension EpisodesCoordinator: EpisodesListViewEventHandling {
    func handle(event: EpisodesListView.Event) {
        switch event {
        case .didSelectEpisode(let episode):
            navigationController.pushViewController(makeEpisodesDetailView(episode: episode), animated: true)
        }
    }
}

// MARK: - Factories
extension EpisodesCoordinator {
    func makeEpisodesDetailView(episode: Episode) -> UIViewController {
        UIHostingController(
            rootView: EpisodeDetailView(episode: episode)
        )
    }
}

// MARK: - Episode Detail Event Handling
extension EpisodesCoordinator: EpisodeDetailEventHandling {
    func handle(event: EpisodeDetailView.Event) {
        switch event {
        case .didTapToOpenInSafari(let episode):
            guard let url = episode.rottenTomatoesUrl else {
                return
            }
            
            navigationController.present(createWebView(url: url), animated: true)
        }
    }
}
