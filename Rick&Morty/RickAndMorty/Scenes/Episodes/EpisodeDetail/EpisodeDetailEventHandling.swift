//
//  EpisodeDetailEventHandling.swift
//  RickAndMorty
//
//  Created by Jan Gutwirth on 07.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

protocol EpisodeDetailEventHandling: AnyObject {
    func handle(event: EpisodeDetailView.Event)
}

