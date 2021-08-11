//
//  DataManager.swift
//  FreeApiApp
//
//  Created by Константин Прокофьев on 07.08.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
//    func fetchData(from url: String?, with complition: @escaping ([Game]) -> Void) {
//
//        guard let urlLink = URL(string: url ?? "") else {return}
//
//        URLSession.shared.dataTask(with: urlLink) { (data, response, error) in
//            if let  error = error {
//                print(error)
//                return
//            }
//            guard let data = data else { return }
//
//            do {
//                let game = try JSONDecoder().decode([Game].self, from: data)
//                DispatchQueue.main.async {
//                    complition(game)
//                }
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }
    
    
    
    //MARK: -ALAMOFIRE getResponse
    
    func  fetchData (from url: String, with complition: @escaping ([Game]) -> Void ) {
        AF.request(url, method: .get).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success( let value):
                guard let gamesData = value as? [[String: Any]] else { return }
                var games: [Game] = []
                for game in gamesData {
                    let game = Game(postData: game)
                    games.append(game)
                }
                complition(games)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
