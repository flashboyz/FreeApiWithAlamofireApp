//
//  GamesCollectionViewController.swift
//  FreeApiApp
//
//  Created by Константин Прокофьев on 07.08.2021.
//
import UIKit

class GamesCollectionViewController: UICollectionViewController {
     let url = "https://www.freetogame.com/api/games"
     private var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NetworkManager.shared.fetchData(from: url) { Game in
//            print(self.Games)
//        fetchData()
        }
    
    
    // MARK: -UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
        }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCell
        let game = games[indexPath.item]
        cell.configur(with: game)
        
        return cell
    }

}
    


//MARK: -extension

extension GamesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 150)
    }
    
  
    func fetchData() {
        
        guard let urlLink = URL(string: url ) else {return}
        
        URLSession.shared.dataTask(with: urlLink) { (data, response, error) in
            if let  error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                self.games = try JSONDecoder().decode([Game].self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}




