//
//  CountryNetworkService.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//

import UIKit

enum CustomErrors: Error {
    case wrongResponse
    case statusCode
}

final class CountryNetworkService {
    
    func fetchCountries(completion: @escaping (CountryResponseData?, Error?) -> Void) {
        let urlString = "https://restcountries.com/v3.1/region/asia"
        let url = URL(string:urlString)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            
            if let error {
                print(error)
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, CustomErrors.wrongResponse)
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(nil, CustomErrors.statusCode )
                return
            }
            
            guard let data else { return }
            
            do {
                let countriesResponseData = try JSONDecoder().decode(CountryResponseData.self, from: data)

                print(countriesResponseData[0].name.common)
                DispatchQueue.main.async {
                    completion(countriesResponseData, nil)
                }

            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
