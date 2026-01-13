//
//  Untitled.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI

struct TrashView: View {
    @StateObject private var viewModel = TrashViewModel()
    
    @State private var isTrashTargeted: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(viewModel.projects, id: \.self) { project in
                        DraggableDocument(
                            name: project,
                            onDelete: {
                                viewModel.deleteProject(name: project)
                            }
                        )
                    }
                }
                .padding(20)
                
                Spacer()
                
                TrashDropArea(isTargeted: $isTrashTargeted)
                    .padding(.bottom, 30)
            }
        }
    }
}
