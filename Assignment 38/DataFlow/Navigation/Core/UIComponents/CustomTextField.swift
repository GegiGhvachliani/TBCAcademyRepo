//
//  TextField.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct TimerTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.gray.opacity(0.5)))
            .padding(12)
            .background(.textField)
            .foregroundColor(.white)
            .font(.system(size: 15))
            .cornerRadius(10)
    }
}
