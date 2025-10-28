//
//  ListPageViewModel.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//
import Foundation

class ListPageViewModel {
    private let networkService: NetworkService = NetworkService()
    private var news: [NewsModel] = []
    
    var reloadData: (() -> Void)?
    
    var newsCount: Int {
        news.count
    }
    
    
    
    func newsAt(index: Int) -> NewsModel? {
        guard index < newsCount else { return nil }
        return news[index]
    }
    
    init() {
        fetchNews()
    }
    
    private func fetchNews() {
        networkService.getData(urlString: "https://imedinews.ge/api/categorysidebarnews/get") { [weak self] (result: NewsResponceData?, error: Error?) in
            self?.news = result?.list ?? []
            self?.reloadData?()
            print(self?.newsCount ?? 0)
        }
    }
    
}
