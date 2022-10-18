//
//  CountryCard.swift
//  Countries
//
//  Created by Alper Yıldırım on 17.10.2022.
//

import SwiftUI

struct CountryCard: View {
    @State private var isFavorite = false
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.name)
                .padding()
            
            Spacer()
            
            FavoriteIconButton(country: country)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
        .padding()
    }
}

struct CountryCard_Previews: PreviewProvider {
    static var previews: some View {
        CountryCard(country: Country(code: "US", currencyCodes: ["USD"], name: "United States of America", wikiDataID: "Q30"))
    }
}
