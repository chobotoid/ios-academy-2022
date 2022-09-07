//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Jan Gutwirth on 02.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct EpisodeDetailView: View {
    let episode: Episode
    let mockedCharacters = Character.characters
    
    enum Event {
        case didTapToOpenInSafari(episode: Episode)
    }
    
    weak var coordinator: EpisodeDetailEventHandling?
    
    var formattedAirDate: String {
        episode.airDate.formatted(
            .dateTime
                .month(.wide)
                .day(.defaultDigits)
                .year()
        )
    }
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            content
        }
        .navigationTitle(episode.name)
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
        .toolbar {
            ToolbarItem {
//                Button(action: toggleMode) {
//                    mode.image
//                }
            }
        }
    }
    
    var content: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text(R.string.localizable.episodeDetailInfo())
                    .font(.appSectionTitle)
                    .foregroundColor(.appTextSectionTitle)
                
                info
                
                Text(R.string.localizable.episodeDetailAppearingCharacters())
                    .font(.appSectionTitle)
                    .foregroundColor(.appTextSectionTitle)
                
                appearingCharacters
            }
            .padding(.horizontal, 16)
        }
    }
    
    var info: some View {
        VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                Image.systemInfoCircle
                
                Text(episode.name)
                    .font(.appItemDescription)
                    .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
            }
            
            HStack(alignment: .center, spacing: 8) {
                Image.systemFilm
                
                Text(episode.code)
                    .font(.appItemDescription)
                    .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
            }
            
            HStack(alignment: .center, spacing: 8) {
                Image.systemPlayTv
                                
                Text(formattedAirDate)
                    .font(.appItemDescription)
                    .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var appearingCharacters: some View {
        ForEach(mockedCharacters) { character in
            EpisodeDetailCharacterView(character: character)
        }
    }
}

//// MARK: - Actions
//private extension EpisodeDetailView {
//    func openInSafari() {
//        withAnimation {
//            EpisodesCoordinator.
//        }
//    }
//}

extension EpisodesCoordinator: EpisodeDetailEventHandling {
    func handle(event: EpisodeDetailView.Event) {
        switch event {
        case let .didTapToOpenInSafari(episode):
            navigationController.pushViewController(
                makeEpisodesDetailView(episode: episode),
                animated: true
            )
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(episode: Episode.mock)
    }
}
