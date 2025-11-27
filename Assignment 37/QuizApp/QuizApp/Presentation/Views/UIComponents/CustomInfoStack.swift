//
//  CustomInfoStack.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//
import SwiftUI

struct CustomInfoStack: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(Font.custom("Sen", size: 18))
                .foregroundStyle(.white)
            
            Text(description)
                .font(Font.custom("Sen", size: 22))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 30)
    }
}
