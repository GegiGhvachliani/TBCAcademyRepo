//
//  ContentView.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MusicAppDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(MusicAppDocument()))
}
