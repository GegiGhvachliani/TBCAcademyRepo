//
//  DetailsView.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct DetailsView: View {
    var timer: TimerModel
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            VStack {
                TopCard(timer: timer)
                    .padding(.top, 10)
                BottomCard(timer: timer)
            }
        }
    }
}

#Preview {
    TimerView()
}
