//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 16.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            content
        }
        .navigationTitle(character.name)
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }
    
    var content: some View {
        ScrollView {
            VStack(spacing: 16) {
                WebImage(url: character.imageUrl)
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                info
                
                episodes
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
        }
    }
    
    var info: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.characterDetailInfo())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            
            HStack(alignment: .top, spacing: 8) {
                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemCreditCard
                        
                        Text(character.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemPersonFillQuestionMark
                        
                        Text(character.species)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                    
                    if !character.type.isEmpty {
                        HStack(alignment: .top, spacing: 8) {
                            Image.systemPersonFillViewFinder

                            Text(character.type)
                                .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                        }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemPersonAndArrowLeft
                        
                        Text(character.gender)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemGlobe
                        
                        Text(character.origin.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemEyes
                        
                        Text(character.location.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .font(.appItemDescription)
        }
        .padding(.horizontal, 8)
    }
    
    var episodes: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(R.string.localizable.characterDetailEpisodes())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            ForEach(Episode.episodes) { episode in
                HStack{
                    Text(episode.name)
                        .font(.appItemLargeTitle)
                        .foregroundColor(.appTextItemTitle)
                    Spacer()
                    Text(episode.code)
                        .font(.appItemDescription)
                        .foregroundColor(.appTextBody)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.appBackgroundItem)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(.horizontal, 8)
    }
}
