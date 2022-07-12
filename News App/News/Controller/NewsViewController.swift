//
//  NewsViewController.swift
//  TIX News
//
//  Created by Indra Cahyadi on 22/02/22.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    internal let cellId = "cellId"
    internal lazy var musicView = MusicView()
    internal lazy var tableView = UITableView()
    private var newsViewModel = [NewsViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasicView()
        setupFooterView()
        setupTableView()
        fetchData()
    }
    
    func setupBasicView() {
        view.backgroundColor = .white
        self.title = Constants.Value.chooseNews
    }
    
    func fetchData() {
        Webservice.shared.fetchNews { (news, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.newsViewModel = news?.map({ return NewsViewModel(news: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell
        let newsViewModel = newsViewModel[indexPath.row]
        cell.newsViewModel = newsViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let newsViewModel = newsViewModel[indexPath.row]
        let heightOfRow = self.heightForText(text: newsViewModel.title, Font: .systemFont(ofSize: 15), Width: self.view.frame.width)
        return (heightOfRow + 100.0)
    }
}
