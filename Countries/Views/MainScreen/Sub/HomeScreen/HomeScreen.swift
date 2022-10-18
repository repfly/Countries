//
//  HomeScreen.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject fileprivate var viewModel = HomeScreenViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.countries, id: \.code) { country in
                        CountryCard(country: country)
                    }
                }
                .padding()
                .animation(.easeIn, value: viewModel.countries)
            }
            .task {
                viewModel.fetchCountries()
            }
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
