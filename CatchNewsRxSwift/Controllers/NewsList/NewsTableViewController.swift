//
//  BaseViewController.swift
//  CatchNewsRxSwift
//
//  Created by Krystyna Kruchkovska on 9/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Daily News"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.name)
        tableView.reloadData()
        populateNews()
        // Do any additional setup after loading the view.
    }
    private func populateNews() {
          
          let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6539ec93952e496db236d97a0706c334")!
          
            Observable.just(url)
              .flatMap { url -> Observable<Data> in
                  let request = URLRequest(url: url)
                  return URLSession.shared.rx.data(request: request)
              }.map { data -> [Article]? in
                print(String(data: data, encoding: String.Encoding.utf8)!)
                  return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
              }.subscribe(onNext: { [weak self] articles in
                  
                  if let articles = articles {
                      self?.articles = articles
                      DispatchQueue.main.async {
                          self?.tableView.reloadData()
                      }
                  }
                  
              }).disposed(by: disposeBag)
      }

}

extension NewsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.name, for: indexPath) as? ArticleCell else {
            fatalError("line\(#line) ArticleCell not found")
        }
        
        cell.descriptionLabel.text = self.articles[indexPath.row].description
        cell.titleLabel.text  = self.articles[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
