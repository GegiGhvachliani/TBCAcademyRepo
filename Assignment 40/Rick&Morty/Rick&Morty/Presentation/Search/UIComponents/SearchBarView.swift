//
//  SearchBarView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    let onClear: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
            
            if !searchText.isEmpty {
                Button(action: onClear) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}
