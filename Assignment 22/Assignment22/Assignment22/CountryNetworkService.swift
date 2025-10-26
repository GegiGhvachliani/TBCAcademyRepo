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
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error  in
            
            if let error {
                print(error)        // თუ ერორი გვაქვს გამოიტანე
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, CustomErrors.wrongResponse)
                return
            }   // თუ რესფონსი ისეთია, როგორიც გვინდა (HTTP), გააგრძელე
            
            guard (200...299).contains(response.statusCode) else {
                completion(nil, CustomErrors.statusCode )
                return
            } // თუ Successful responses გვაქვს, მაშინ გააგრძელე //HTTP URL response types დაგუგლე
            //            Informational responses ( 100 – 199 )
            //            Successful responses ( 200 – 299 )
            //            Redirection messages ( 300 – 399 )
            //            Client error responses ( 400 – 499 )
            //            Server error responses ( 500 – 599 )
            
            guard let data else { return }  //თუ ყველაფერი შესრულდა და Data-ც მაქვს, გააგრძელე:
            
            //    data მგონი უკვე არის ის JSON სტრინგი, რომლიდანაც ვადეკოდირებთ - ar vici
            
            do {
                let countriesResponseData = try JSONDecoder().decode(CountryResponseData.self, from: data)
//                                self?.fruits.append(contentsOf: fruitResponseData.fruits)
//                                self?.fruitsChanged?() //ესენი აღარ გვჭირდება
                print(countriesResponseData[0].name.common)
                DispatchQueue.main.async {
                    completion(countriesResponseData, nil)   // completion აუცილებლად უნდა მოხდეს main thread-ზე
                }

            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
