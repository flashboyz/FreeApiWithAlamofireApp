//
//  GameCellModel.swift
//  FreeApiApp
//
//  Created by Константин Прокофьев on 08.08.2021.
//

import UIKit

class GameCell: UICollectionViewCell {
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameTitleLable: UILabel!
    @IBOutlet weak var gameGenreLabel: UILabel!
    
    func configur(with game: Game) {
        gameTitleLable.text = game.title
        gameGenreLabel.text = game.genre
        
        guard let url = URL(string: game.thumbnail ) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return}
        DispatchQueue.main.async {
            self.gameImageView.image = UIImage(data: imageData)
        }
    }
}
