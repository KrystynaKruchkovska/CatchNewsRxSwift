//
//  URLREquest+Extensions.swift
//  CatchNewsRxSwift
//
//  Created by Krystyna Kruchkovska on 9/27/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Resorse<T:Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resourse:Resorse<T>) -> Observable<T?> {
        
        return Observable.just(resourse.url)
            .flatMap{ url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
        }.map { data -> T? in
            return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
