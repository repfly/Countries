//
//  FavoritesScreen\.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    var body: some View {
        CountryCard()
        
        
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
        
    }
}

struct CountryCard: View {
    var isFilled: Bool = true;
    var body: some View {
        HStack {
            Text("country name")
                .padding()
            
            Spacer()
            
            Image(systemName: isFilled ? "star.fill" :  "star")
                .imageScale(.large)
                .padding()
                .foregroundColor(Color.black)
                .onTapGesture {
                    
                }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
        .padding()
    }
}
