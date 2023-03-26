//
//  RatingView.swift
//  MovieApp
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.2), lineWidth: 5.0)
            Circle()
                .trim(from: 0, to: CGFloat(rating) / 10.0)
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round))
                .foregroundColor(.orange)
                .rotationEffect(.degrees(-90))
            Text(String(format: "%.1f", rating))
                .foregroundColor(.white)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.5)
            .frame(width: 50, height: 50)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.black)
            
    }
}
