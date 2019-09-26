//
//  ArticleCell.swift
//  CatchNewsRxSwift
//
//  Created by Krystyna Kruchkovska on 9/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

final class ArticleCell: UITableViewCell {
    
    static let name = "ArticleCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.vertical)
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for:.vertical)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
}
