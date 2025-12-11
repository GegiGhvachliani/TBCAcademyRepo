//
//  AudioManager.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import AVFoundation
import Combine

class AudioManager: ObservableObject {
    
    private var audioPlayer: AVAudioPlayer?
    
    @Published var isPlaying: Bool = false
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    
    private var timer: Timer?
    
    func loadAudio(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            duration = audioPlayer?.duration ?? 0
            currentTime = 0
        } catch {
            print("Error: \(error)")
        }
    }
    
    func start() {
        audioPlayer?.play()
        isPlaying = true
        startTimer()
    }
    
    func pause() {
        audioPlayer?.pause()
        isPlaying = false
        stopTimer()
    }
    
    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            start()
        }
    }
    
    func skipForward() {
        guard let player = audioPlayer else { return }
        let newTime = player.currentTime + 10
        
        player.currentTime = min(newTime, player.duration)
        currentTime = player.currentTime
    }
    
    func skipBackward() {
        guard let player = audioPlayer else { return }
        let newTime = player.currentTime - 10
        
        player.currentTime = max(newTime, 0)
        currentTime = player.currentTime
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
            guard let self = self, let player = self.audioPlayer else { return }
            self.currentTime = player.currentTime
            
            if player.currentTime >= player.duration {
                self.isPlaying = false
                self.stopTimer()
            }
        })
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
