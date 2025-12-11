//
//  AudioManager.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import AVFoundation
import Combine

protocol AudioManagerProtocol {
    var onStateChange: ((Bool, TimeInterval, TimeInterval) -> Void)? { get set }
    func loadAudio(fileName: String)
    func togglePlayPause()
    func skipForward()
    func skipBackward()
}

class AudioManager: AudioManagerProtocol {
    
    var onStateChange: ((Bool, TimeInterval, TimeInterval) -> Void)?
    
    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    
    private var isPlaying: Bool = false
    private var currentTime: TimeInterval = 0
    private var duration: TimeInterval = 0
    
    func loadAudio(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            duration = audioPlayer?.duration ?? 0
            currentTime = 0
            notifyStateChange()
        } catch {
            print("Error: \(error)")
        }
    }
    
    func togglePlayPause() {
        isPlaying ? pause() : start()
    }
    
    func skipForward() {
        guard let player = audioPlayer else { return }
        player.currentTime = min(player.currentTime + 10, player.duration)
        currentTime = player.currentTime
        notifyStateChange()
    }
    
    func skipBackward() {
        guard let player = audioPlayer else { return }
        player.currentTime = max(player.currentTime - 10, 0)
        currentTime = player.currentTime
        notifyStateChange()
    }
    
    private func start() {
        audioPlayer?.play()
        isPlaying = true
        startTimer()
    }
    
    private func pause() {
        audioPlayer?.pause()
        isPlaying = false
        stopTimer()
        notifyStateChange()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self, let player = self.audioPlayer else { return }
            self.currentTime = player.currentTime
            
            if player.currentTime >= player.duration {
                self.isPlaying = false
                self.stopTimer()
            }
            self.notifyStateChange()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func notifyStateChange() {
        onStateChange?(isPlaying, currentTime, duration)
    }
}
