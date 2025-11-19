//
//  MainPageViewModel.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//
 
final class MainPageViewModel {
     var countries: CountryResponseData = []
    private var newtworkService: CountryNetworkService = CountryNetworkService()
    
    var releadTableView: (() -> Void)?
    
    var countriesCount: Int {
        countries.count
    }
    
    init() {
        fetchCountries()
    }
    
    func countryAt(index: Int) -> Country? {
        guard index < countriesCount else { return nil}
        return countries[index]
    }
    
    func fetchCountries() {
        newtworkService.fetchCountries { [weak self] data, error in
            self?.countries = data ?? []
            self?.releadTableView?()
            print(self?.countries[0].name ?? "no info")
        }
    }
}
