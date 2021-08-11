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
        NetworkManager.shared.fetchData(from: url) { games in
            DispatchQueue.main.async {
                self.games = games
                self.collectionView.reloadData()
            }
        }
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
}




