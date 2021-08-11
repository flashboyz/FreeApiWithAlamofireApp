//
//  GameModel.swift
//  FreeApiApp
//
//  Created by Константин Прокофьев on 07.08.2021.
//


struct Game: Decodable {
    
    let title: String
    let genre: String
    let thumbnail: String
    
    init(postData: [String: Any]) {
        title = postData["title"] as? String ?? ""
        genre = postData["genre"] as? String ?? ""
        thumbnail = postData["thumbnail"] as? String ?? ""
    }
}
