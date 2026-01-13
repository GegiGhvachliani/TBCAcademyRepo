//
//  PokedexHeaderComponentView.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//

import SwiftUI

struct PokedexHeaderComponentView: View {
    
    let imageURL: String
    
    @State private var image: UIImage?
    
    var body: some View {
        VStack(spacing: 8) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } else {
                ProgressView()
                    .frame(height: 200)
            }
            
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
}
