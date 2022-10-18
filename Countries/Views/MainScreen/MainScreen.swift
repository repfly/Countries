//
//  HomeScreen.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            FavoritesScreen()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Saved")
                }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
