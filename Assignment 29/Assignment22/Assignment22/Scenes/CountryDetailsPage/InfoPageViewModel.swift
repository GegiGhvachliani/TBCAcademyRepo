//
//  InfoPageViewModel.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//


import Foundation

class InfoPageViewModel {
    
    var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var name: String {
        country.name.common
    }
    
    var nativeName: String {
        country.name.nativeName?.values.first?.official ?? "No info"
    }
    
    var spelling: String {
        country.spelling!.last ?? "no spelling"
    }
    var capital: String {
        country.capital?.first ?? "no capital"
    }
    var currencyName: String {
        country.currency?.values.first?.name ?? "🤷🏻‍♂️"
    }
    var currencySymbol: String {
        country.currency?.values.first?.symbol ?? "💵"
    }
    var googleMaps: String {
        country.mapLink.googleMaps ?? "N/A"
    }
    var openStreetMaps: String {
        country.mapLink.openStreetMaps ?? "N/A"
    }
    var flagImage: String {
        country.flag.png ?? "N/A"
    }
    var flagInfo: String {
        country.flag.alt ?? "N/A"
    }
}
