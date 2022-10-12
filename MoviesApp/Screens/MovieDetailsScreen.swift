//
//  MovieDetailsScreen.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        
        VStack{
            
            if movieDetailViewModel.loadingState == .loading{
                
                LoadingView()
            }else if movieDetailViewModel.loadingState == .failed{
                
                FailedView()
            }else if movieDetailViewModel.loadingState == .success{
                
                MovieDetailsView(movieDetaulVM: self.movieDetailViewModel)
            }
        }
        .onAppear{
            
            self.movieDetailViewModel.getDetailsByImdbId(imdbId: self.imdbId)
        }
    }
}
