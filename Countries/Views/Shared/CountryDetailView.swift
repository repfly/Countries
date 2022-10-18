//
//  CountryDetail.swift
//  Countries
//
//  Created by Alper Yıldırım on 17.10.2022.
//

import SwiftUI
import SVGView

struct CountryDetailView: View {
    @State var countryDetail: CountryDetail?
    let countryCode: String
    @State private var showWebView = false
    let placeHolderFlag: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Vlag_ontbreekt.svg/2560px-Vlag_ontbreekt.svg.png"
    var body: some View {
        VStack(alignment: .leading) {
            SVGView(contentsOf: URL(string: countryDetail?.data.flagImageURI ?? placeHolderFlag)!)
                .aspectRatio(1.0, contentMode: ContentMode.fit)
                .frame(width: UIScreen.screenWidth)
            
            Text("Country code: \(countryCode)")
                .padding(.leading, 48)
            Button {
                showWebView.toggle()
            } label: {
                Text("For More Information")
                Image(systemName: "arrow.right")
            }
            .buttonStyle(.borderedProminent)
            .padding(.leading, 48)
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: "https://www.wikidata.org/wiki/\(countryDetail?.data.wikiDataID ?? "")")!)
            }
            Spacer()
        }
        .navigationTitle(countryDetail?.data.name ?? "Unkown name")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            FavoriteIconButton(country: Country(code: countryDetail?.data.code ?? "", currencyCodes: countryDetail?.data.currencyCodes ?? [], name: countryDetail?.data.name ?? "", wikiDataID: countryDetail?.data.wikiDataID ?? ""))
        }
        .frame(alignment: .top)
        .task {
            CountriesService.shared.fetchcountryDetail(countryCode: countryCode) { response in
                switch response {
                case .success(let detail):
                    self.countryDetail = detail
                    print(detail)
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
}


//struct CountryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryDetailView(countryCode: "q30")
//    }
//}
