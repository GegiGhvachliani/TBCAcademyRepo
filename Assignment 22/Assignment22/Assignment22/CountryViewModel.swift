//
//  CountryViewModel.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//
 
class CountryViewModel {
    private var countries: [CountryModel] = []
    private var newtworkService: CountryNetworkService = CountryNetworkService()
    
    var countriesChanged: (() -> Void)?
    
    init() {
        fetchCountries()
    }

    
    func fetchCountries() {
        newtworkService.fetchCountries { [weak self] data, error in
            self?.countries = data ?? []
            self?.countriesChanged?()
            print(self?.countries[0].name ?? "gegi ylea")
        }
    }
}
