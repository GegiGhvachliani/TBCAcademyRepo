//
//  CustomProgressView.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct CustomProgressView: UIViewRepresentable {
    var progress: Float
    func makeUIView(context: Context) -> UIProgressView {
        let progressView = UIProgressView()
        
        progressView.progress = progress
        progressView.progressTintColor = UIColor(named: "ProgressViewFill")
        progressView.trackTintColor = UIColor.progressViewTrack.withAlphaComponent(0.3)
        
        return progressView
    }
    
    func updateUIView(_ uiView: UIProgressView, context: Context) {
        uiView.progress = progress
    }
}
