//
//  TrashDropArea.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI

struct TrashDropArea: View {
    @Binding var isTargeted: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: isTargeted ? "trash.fill" : "trash")
                .resizable()
                .frame(width: 40, height: 45)
                .foregroundStyle(.white)
                .padding(.trailing, 30)
        }
    }
}
