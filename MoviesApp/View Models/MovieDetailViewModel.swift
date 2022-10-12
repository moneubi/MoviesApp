//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import Foundation
import SwiftUI


class MovieDetailViewModel: ObservableObject{
    
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    private var httpclient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil){
        
        self.movieDetail = movieDetail
    }
    
    func getDetailsByImdbId(imdbId: String){
        
        httpclient.getMovieDetailBy(imdbID: imdbId){ result in
            
            switch result{
                
                case .success(let details):
                        
                    DispatchQueue.main.async {
                  
                        self.movieDetail = details
                        self.loadingState = .success
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.loadingState = .failed
                    }
            }
        }
    }
    
    var title: String{
        
        self.movieDetail?.title ?? ""
    }
    
    var poster: String{
        
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String{
        
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int{
        
        get{
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String{
        
        self.movieDetail?.director ?? ""
    }
}
