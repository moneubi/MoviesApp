//
//  MovieListView.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    
    var body: some View {
        
        List(self.movies, id: \.imdbId){ movie in
            
            NavigationLink(destination: MovieDetailsScreen(imdbId: movie.imdbId)){
                
                MovieCell(movie: movie)
            }
        }
    }
}


struct MovieCell: View{
    
    let movie: MovieViewModel
    
    var body: some View{
        
        HStack(alignment: .top){
            
            URLImage(url: movie.poster)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            VStack(alignment: .leading){
                
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }
            .padding(5)
            
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
