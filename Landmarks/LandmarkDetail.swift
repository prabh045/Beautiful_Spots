//
//  ContentView.swift
//  Landmarks
//
//  Created by Prabhdeep Singh on 06/07/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
     @EnvironmentObject var userData: UserData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
          userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
      }
    
    var body: some View {
        VStack {
            
            MapView(coordinate: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height: 300)
            
            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }.padding()
            
            Spacer()
        }.navigationBarTitle(Text(landmark.name), displayMode: .inline)
     
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
