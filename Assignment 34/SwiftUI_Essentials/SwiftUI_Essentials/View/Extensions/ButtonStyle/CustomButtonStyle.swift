//
//  CustomButtonStyle.swift
//  SwiftUI_Essentials
//
//  Created by Gegi Ghvachliani on 20.11.25.
//

import Foundation
import SwiftUI

struct Custom { }

extension Custom {
    struct ButtonStyle: SwiftUI.ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaledToFit()
                .frame(width: 40, height: 40)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color.black.opacity(0.2))
                .cornerRadius(20)
                .shadow(radius: 5, y: 10)
                .padding(10)
        }
    }
}


