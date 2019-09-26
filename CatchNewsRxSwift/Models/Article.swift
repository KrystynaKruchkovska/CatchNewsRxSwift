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

struct Article: Decodable {
    let title: String
    let description: String
}
