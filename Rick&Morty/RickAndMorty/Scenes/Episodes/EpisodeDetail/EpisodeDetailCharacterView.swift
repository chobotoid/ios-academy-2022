//
//  EpisodeDetailCharacterView.swift
//  RickAndMorty
//
//  Created by Jan Gutwirth on 07.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct EpisodeDetailCharacterView: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 16) {
            Text(character.name)
                .font(.appItemSmallTitle)
                .foregroundColor(.appTextItemTitle)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Text(character.species)
                .font(.appItemSmallTitle)
                .foregroundColor(.appTextBody)
                .multilineTextAlignment(.leading)
        }
        .padding(16)
        .background(Color.appBackgroundItem)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct EpisodeDetailCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailCharacterView(character: Character.mock)
    }
}
