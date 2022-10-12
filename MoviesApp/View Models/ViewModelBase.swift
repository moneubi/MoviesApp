//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by VO2 Maroc  on 12/10/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

enum LoadingState{
    
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject{
    
    @Published var loadingState: LoadingState = .none
}
