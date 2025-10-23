//
//  CountriesListViewModel.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 22.10.25.
//

class CountriesListViewModel {
    private var countries: [CountryModel] = []
    
    var numberOfCountries: Int {
         countries.count
    }
    
    func country(at index: Int) -> CountryModel {
        countries[index]
    }
    
   // var countryService: CountryService = CountryService()
    
    var countriesChanged: (() -> Void?)? //გვინდა?
    
    init() {
        addCountries()
    }
    
    func addCountries() {
//        fruitService.addSomeFruit(completion: { [weak self] newFruit in
//            self?.fruits = newFruit
//            self?.fruitsChanged?()   //თუ ზედა ორი დაგვჭირდა ესენიც დაგვჭირდება
    }
}
