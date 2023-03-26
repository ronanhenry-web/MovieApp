//
//  MovieCellView.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI
import Kingfisher

struct MovieCellView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            KFImage(movie.posterURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 150)
                .clipped()
                .cornerRadius(8)
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title)
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                    Spacer()
                    RatingView(rating: movie.rating)
                        .frame(width: 40, height: 40)
                        .padding(6)
                }
                Text(movie.description)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: .preview)
            .background(.black)
    }
}
