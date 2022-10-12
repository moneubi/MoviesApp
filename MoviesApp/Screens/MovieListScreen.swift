//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
    
    //
    @ObservedObject private var movieViewModel: MovieListViewModel
    @State private var movieName = ""
    //
    
    init() {
        
        self.movieViewModel = MovieListViewModel()
        //self.movieViewModel.searchByName("batman")
    }
    
    var body: some View {
        
        VStack{
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                
                //perform the search
                self.movieViewModel.searchByName(self.movieName)
            })
            .frame(height: 50)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(15)
            
            Spacer()
            
            .navigationBarTitle("Movies App")
            
            if self.movieViewModel.loadingState == .success{
                
                MovieListView(movies: self.movieViewModel.movies)
            }else if self.movieViewModel.loadingState == .failed{
                FailedView()
            }else if self.movieViewModel.loadingState == .loading{
                
                LoadingView()
            }
        }
        .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
