//
//  CustomProgressView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

import SwiftUI

struct CustomProgressView: View {
    let value: Double
    let total: Double
    
    var progress: Double {
        guard total > 0 else { return 0 }
        return value / total
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.incorrectAnswer)
                    .frame(width: geometry.size.width,
                           height: 35)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.correctAnswer)
                    .frame(
                        width: geometry.size.width * progress,
                        height: 35
                    )
            }
        }
        .frame(height: 35)
        .padding(.horizontal, 35)
    }
}
