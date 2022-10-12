//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movieDetaulVM: MovieDetailViewModel
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: 10){
                
                URLImage(url: movieDetaulVM.poster)
                    .cornerRadius(10)
                
                Text(movieDetaulVM.title)
                    .font(.title)
                Text(movieDetaulVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetaulVM.director)
                HStack{
                    
                    Rating(rating: .constant(movieDetaulVM.rating))
                    Text("\(movieDetaulVM.rating)/10")
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(self.movieDetaulVM.title)
        }
    }
}
