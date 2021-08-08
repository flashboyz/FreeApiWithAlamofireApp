//
//  DataManager.swift
//  FreeApiApp
//
//  Created by Константин Прокофьев on 07.08.2021.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    
    func fetchData(from url: String?, with complition: @escaping ([Game]) -> Void) {
        
        guard let urlLink = URL(string: url ?? "") else {return}
        
        URLSession.shared.dataTask(with: urlLink) { (data, response, error) in
            if let  error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let game = try JSONDecoder().decode([Game].self, from: data)
                DispatchQueue.main.async {
                    complition(game)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
