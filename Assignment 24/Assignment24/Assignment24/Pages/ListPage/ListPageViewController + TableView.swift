//
//  ListPageViewController + TableView.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//
import UIKit
extension ListPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListPageCell", for: indexPath) as? ListPageCell, let news = viewModel.newsAt(index: indexPath.row)
        else  { return UITableViewCell() }
        
        cell.configureCellWith(news: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsForNextVC = viewModel.newsAt(index: indexPath.row)
        let nextVC = DescriptionPageViewController(viewModel: DescriptionPageViewModel(news: newsForNextVC!))
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
