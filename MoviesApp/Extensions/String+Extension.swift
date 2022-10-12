//
//  String+Extension.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

extension String{
    
    func trimmedAndEscaped() -> String{
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
