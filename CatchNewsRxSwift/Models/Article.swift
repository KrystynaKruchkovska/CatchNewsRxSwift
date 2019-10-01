//
//  Article.swift
//  CatchNewsRxSwift
//
//  Created by Krystyna Kruchkovska on 9/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    
    static var all:  Resorse<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6539ec93952e496db236d97a0706c334")!
        return Resorse(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}
