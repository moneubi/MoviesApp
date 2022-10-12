//
//  Movie.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

struct MopvieResponse: Codable{
    
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey{
        
        case movies = "Search"
    }
}

struct Movie: Codable{
    
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    let type: String
    
    private enum CodingKeys: String, CodingKey{
        
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
        case type = "Type"
    }
}
