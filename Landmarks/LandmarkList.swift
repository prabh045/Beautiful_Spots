//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Prabhdeep Singh on 07/07/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    //State is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout. You use a property with the @State attribute to add state to a view.
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        NavigationView {
            List {
                //    A binding acts as a reference to a mutable state. When a user taps the toggle from off to on, and off again, the control uses the binding to update the view’s state accordingly
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favourites Only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                        
                    }
                }
            }.navigationBarTitle(Text("Landmarks"),displayMode: .inline)
        }
    }
    
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(["iPhone 11"], id: \.self, content: { device in
                LandmarkList().previewDevice(PreviewDevice(rawValue: device))
            })
        }
    }
}
