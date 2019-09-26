//
//  APIRequest.swift
//  CatchNewsRxSwift
//
//  Created by Krystyna Kruchkovska on 9/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

protocol APIRequest {
    var baseUrl: String { get }
    var path: String { get }
    var method: String { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
}

extension APIRequest {
    var baseUrl: String {
        return "https://newsapi.org"
    }
    
}
