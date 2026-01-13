//
//  DetailsViewModel.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import Foundation
import Combine

protocol DetailsViewModelProtocol {
    func loadMusic(_ music: Music)
    func togglePlayPause()
    func skipForward()
    func skipBackward()
}

final class DetailsViewModel: DetailsViewModelProtocol, ObservableObject {
    
    private var audioManager: AudioManagerProtocol
    
    @Published var isPlaying: Bool = false
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    
    var progress: Float {
        guard duration > 0 else { return 0 }
        return Float(currentTime / duration)
    }
    
    init(audioManager: AudioManagerProtocol = AudioManager()) {
        self.audioManager = audioManager
        setupBindings()
    }
    
    private func setupBindings() {
        audioManager.onStateChange = { [weak self] isPlaying, currentTime, duration in
            self?.isPlaying = isPlaying
            self?.currentTime = currentTime
            self?.duration = duration
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
