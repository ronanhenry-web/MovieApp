//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    let movie: Movie
    
    // 1 - Créer une variable contenant les acteurs
    
    @StateObject private var casting = Casting(actors: [])
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(movie.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .overlay(alignment: .bottom) {
                        VStack(spacing: 0) {
                            LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                                .frame(height: 300)
                            Rectangle()
                                .frame(height: 100)
                        }
                        
                    }
                    .overlay(alignment: .bottomLeading) {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.title)
                                .bold()
                            Text(movie.description)
                                .lineLimit(5)
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                if casting.actors.isEmpty {
                    Text("Loading...")
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(casting.actors) { actorObject in
                                
                                ActorCell(actor: actorObject)
                                
                            }
                        }
                    }
                    
                }
                // Afficher la liste des acteurs OU une vue de chargement si les acteurs ne sont pas encore chargés
            }
        }
        .ignoresSafeArea()
        .onAppear {
            loadCasting()
        }
    }
    
    private func loadCasting() {
        Task {
            // 2 - Chargement des acteurs
            let castingURL = URL(string: "https://api.themoviedb.org/3/movie/\(movie.id)/credits?api_key=ee6b2b9e0970948e6741d6b7985191fb")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: castingURL)
                
                let apiMovieCast = try JSONDecoder().decode(APIMovieCast.self, from: data)
                                
                for apiActor in apiMovieCast.cast {
                    
                    var profileURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541")!
                    
                    if let path = apiActor.profilePath {
                        profileURL = URL(string: "https://image.tmdb.org/t/p/w500/\(path)")!
                    }
                    
                    let newActor = Actor(
                        name: apiActor.name,
                        profileURL: profileURL,
                        characterName: apiActor.character
                    )
                    
                    self.casting.actors.append(newActor)
                }
            } catch {
                print(error)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
