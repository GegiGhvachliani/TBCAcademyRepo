//
//  MainView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = .gray
        }
    @StateObject var viewModel = QuizViewModel.create()
    var body: some View {
        
        TabView {
            QuestionPageView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("Quiz")

                }
            
            UserPageView()
                .tabItem {
                    Image(systemName: "text.rectangle.page")
                    Text("Profile")
                }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    MainView()
}
