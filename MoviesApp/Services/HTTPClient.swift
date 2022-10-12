//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error{
    
    case badURL
    case noData
    case decodingError
}

class HTTPClient{
    
    func getMovieDetailBy(imdbID: String, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void){
        
        guard let url = URL.forMovieByImdbId(imdbID) else{
            
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data)else{
                
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetail))
        }.resume()
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void){
        
        guard let url = URL.forMoviesName(search) else{
            
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MopvieResponse.self, from: data)else{
                
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
