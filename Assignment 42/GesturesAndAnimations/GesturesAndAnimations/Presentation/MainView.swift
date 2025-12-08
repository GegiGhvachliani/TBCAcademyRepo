//
//  Untitled.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var listViewModel = ListViewModel()
    
    var body: some View {
        TabView {
            ListView(viewModel: listViewModel)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            
            SpinView(listViewModel: listViewModel)
                .tabItem {
                    Label("Spin", systemImage: "steeringwheel")
                }
            
            TrashView()
                .tabItem {
                    Label("Trash", systemImage: "trash")
                }
        }
    }
}

#Preview {
    MainView()
}
