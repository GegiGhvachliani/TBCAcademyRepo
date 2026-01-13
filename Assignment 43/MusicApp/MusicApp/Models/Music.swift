//
//  Music.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import Foundation

struct Music: Identifiable, Hashable {
    let id: UUID
    let title: String
    let artistName: String
    let imageName: String
    let audioFileName: String
    
    init(id: UUID = UUID(), title: String, artistName: String, imageName: String, audioFileName: String) {
        self.id = id
        self.title = title
        self.artistName = artistName
        self.imageName = imageName
        self.audioFileName = audioFileName
    }
}
