//
//  DetailsViewModel.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import Foundation
import Combine

final class DetailsViewModel: ObservableObject {
    private var audioManager = AudioManager()
    private var cancellable: AnyCancellable?
    
    var isPlaying: Bool { audioManager.isPlaying }
    var currentTime: TimeInterval { audioManager.currentTime }
    var duration: TimeInterval { audioManager.duration }
    
    var progress: Float {
        guard duration > 0 else { return 0 }
        return Float(currentTime / duration)
    }
    
    init() {
        cancellable = audioManager.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func loadMusic(_ music: Music) {
        audioManager.loadAudio(fileName: music.audioFileName)
    }
    
    func togglePlayPause() {
        audioManager.togglePlayPause()
    }
    
    func skipForward() {
        audioManager.skipForward()
    }
    
    func skipBackward() {
        audioManager.skipBackward()
    }
}
