//
//  URL+Extension.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL{
    
    static func forMoviesName(_ name: String) -> URL?{
        
        return URL(string: "\(Constants.BASE_URL)?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMovieByImdbId(_ imdbId: String) -> URL?{
        
        return URL(string: "\(Constants.BASE_URL)?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
}
