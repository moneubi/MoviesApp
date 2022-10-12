//
//  View+Extension.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

extension View{
    
    func embedNavigationView() -> some View{
        
        return NavigationView{ self }
    }
}
