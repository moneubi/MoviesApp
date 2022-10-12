//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import Foundation
import SwiftUI

class MovieListViewModel: ViewModelBase{
    
    @Published var movies: [MovieViewModel] = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    //
    func searchByName(_ name: String){
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        //
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()){ result in
            
            switch result{
                
                case .success(let movies):
                    if let movies = movies{
                        
                        DispatchQueue.main.async {
                            
                            self.movies = movies.map(MovieViewModel.init)
                            self.loadingState = .success
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.loadingState = .failed
                    }
            }
        }
    }
}

struct MovieViewModel{
    
    let movie: Movie
    var imdbId: String{
        
        movie.imdbId
    }
    
    var title: String{
        
        movie.title
    }
    
    var year: String{
        
        movie.year
    }
    
    var type: String{
        
        movie.type
    }
    
    var poster: String{
        
        movie.poster
    }
}
