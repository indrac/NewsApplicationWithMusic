//
//  NewsCell.swift
//  TIX News
//
//  Created by Indra Cahyadi on 28/02/22.
//

import UIKit

class NewsCell: UITableViewCell {
    
    private let authorText = "Author: "
    
    var newsViewModel: NewsViewModel! {
        didSet {
            articleImage.loadImageUsingUrlString(urlString: newsViewModel.image)
            titleLabel.text = newsViewModel.title
            if !newsViewModel.author.isEmpty {
                authorLabel.text = "\(authorText) \(newsViewModel.author)"
            } else {
                authorLabel.text = "\(authorText) -"
            }
        }
    }
    
    let articleImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "placeholder-image")
        imageView.layer.cornerRadius = 15.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        addSubview(articleImage)
        addSubview(titleLabel)
        addSubview(authorLabel)
        setupCellConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCellConstraint() {
        
        NSLayoutConstraint.activate([
            articleImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            articleImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            articleImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            articleImage.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: articleImage.rightAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leftAnchor.constraint(equalTo: articleImage.rightAnchor, constant: 12),
            authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            authorLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
