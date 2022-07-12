//
//  NewsView.swift
//  TIX News
//
//  Created by Indra Cahyadi on 28/02/22.
//

import UIKit

extension NewsViewController {
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: musicView.topAnchor),
        ])
    }
    
    func setupFooterView() {
        view.addSubview(musicView)
        
        NSLayoutConstraint.activate([
            musicView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            musicView.heightAnchor.constraint(equalToConstant: 100),
            musicView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            musicView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func heightForText(text: String,Font: UIFont,Width: CGFloat) -> CGFloat {

        let constrainedSize = CGSize.init(width:Width, height: CGFloat(MAXFLOAT))

        let attributesDictionary = NSDictionary.init(object: Font, forKey: NSAttributedString.Key.font as NSCopying)

        let mutablestring = NSAttributedString.init(string: text, attributes: attributesDictionary as? [NSAttributedString.Key : Any])

        var requiredHeight = mutablestring.boundingRect(with:constrainedSize, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), context: nil)

        if requiredHeight.size.width > Width {
            requiredHeight = CGRect.init(x: 0, y: 0, width: Width, height: requiredHeight.height)
        }
        return requiredHeight.size.height;
    }
    
}
