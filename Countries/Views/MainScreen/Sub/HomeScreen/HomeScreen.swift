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
        
        ScrollView {
              VStack(alignment: .leading) {
                  ForEach(viewModel.countries, id: \.code) { country in
                      CountryCard(country: country)
                  }
              }
              .padding()
                  .edgesIgnoringSafeArea(.bottom)
                  .animation(.easeIn, value: viewModel.countries)
        }.task {
            viewModel.fetchCountries()
        }.refreshable {
            viewModel.fetchCountries()
        }
        
      
    }
}


struct CountryCard: View {
    let isFilled: Bool = false;
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.name)
                .padding()
            
            Spacer()
            
            Image(systemName: isFilled ? "star.fill" :  "star")
                .imageScale(.large)
                .padding()
                .foregroundColor(Color.black)
                .onTapGesture {
                    print("ontap")
                }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
        .padding()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
