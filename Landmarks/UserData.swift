//
//  UserData.swift
//  Landmarks
//
//  Created by Prabhdeep Singh on 10/07/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
   @Published var showFavoritesOnly = false
   @Published var landmarks = landmarkData
}
