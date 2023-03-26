//
//  ActorCell.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI
import Kingfisher

struct ActorCell: View {
    
    let actor: Actor
    
    var body: some View {
        VStack {
            KFImage(actor.profileURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(actor.name)
            Text(actor.characterName)
        }
    }
}

struct ActorCell_Previews: PreviewProvider {
    static var previews: some View {
        ActorCell(actor: .previewActors.first!)
    }
}
