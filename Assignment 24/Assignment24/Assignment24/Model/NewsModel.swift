//
//  NewsModel.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//
import Foundation

struct NewsResponceData: Decodable {
    let list: [NewsModel]
    
    private enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}

struct NewsModel: Decodable {
    let title: String
    let time: String
    let url: String
    let photoUrl: String
    
    private enum CodingKeys: String, CodingKey {
            case title = "Title"
            case time = "Time"
            case url = "Url"
            case photoUrl = "PhotoUrl"
        }
}
