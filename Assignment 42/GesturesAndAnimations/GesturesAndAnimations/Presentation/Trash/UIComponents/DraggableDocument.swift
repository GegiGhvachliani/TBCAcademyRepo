//
//  DraggableDocument.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//
import SwiftUI

struct DraggableDocument: View {
    var name: String
    var onDelete: () -> Void
    
    @State private var offset: CGSize = .zero
    @State private var isDragging: Bool = false
    
    var body: some View {
        VStack {
            ZStack{
                Image(systemName: "document")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 80)
                    .foregroundStyle(.white)
                
                Text(name)
                    .font(.subheadline)
                    .frame(width: 60)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .offset(y:10)
            }
        }
        .offset(offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = value.translation
                    isDragging = true
                }
                .onEnded { value in
                    isDragging = false
                    
                    if value.translation.height > 400 {
                        withAnimation {
                            onDelete()
                        }
                    }
                    
                    withAnimation {
                        offset = .zero
                    }
                }
        )
        .opacity(isDragging ? 0.7 : 1.0)
    }
}
