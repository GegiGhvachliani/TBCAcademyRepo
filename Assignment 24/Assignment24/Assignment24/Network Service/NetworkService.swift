//
//  NetworkService.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//

import Foundation

class NetworkService {
    
    
    func getData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string:urlString) else {
            completion(nil, CustomErrors.invalidURL)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            
            if let error {
                print(error)
                completion(nil, error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, CustomErrors.wrongResponse)
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(nil, CustomErrors.statusCode )
                return
            }
            
            guard let data else {
                completion(nil, CustomErrors.noData)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData, nil)
                }

            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
