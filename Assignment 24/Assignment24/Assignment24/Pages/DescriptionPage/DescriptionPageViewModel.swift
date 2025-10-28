//
//  DescriptionPageViewModel.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//
import UIKit

class DescriptionPageViewModel {
    private var news: NewsModel
    
    init(news: NewsModel) {
        self.news = news
    }
    
    var newsImage: String {
        news.photoUrl
    }
    
    var newsTime: String {
        news.time
    }
    
    var newsInfo: String {
        news.title
    }
    
    var newsLink: String {
        news.url
    }
    
     var buttonTitle: String {
        "უფრო ვრცლად"
    }
    
    var buttonBackgroundImage: UIImage? {
        UIImage(named: "BigBrotherIsWatchingYou")
    }
    
     func openLink() {
        guard let url = URL(string: newsLink) else { return }
        
        UIApplication.shared.open(url)
    }
    
    
}

