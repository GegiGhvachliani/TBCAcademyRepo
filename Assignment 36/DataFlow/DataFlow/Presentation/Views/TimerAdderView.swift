//
//  TimerAdderView.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import SwiftUI

struct TimerAdderView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    @State var title: String = ""
    @State var hours: String = ""
    @State var minutes: String = ""
    @State var seconds: String = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            TextField("", text: $title, prompt: Text("ტაიმერის სახელი...").foregroundStyle(.gray.opacity(0.5)))
                .padding(12)
                .background(.textField)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            HStack (spacing: 15) {
                
                TextField("", text: $hours, prompt: Text("სთ").foregroundStyle(.gray.opacity(0.5)))
                    .padding(12)
                    .background(.textField)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                TextField("", text: $minutes, prompt: Text("წთ").foregroundStyle(.gray.opacity(0.5)))
                    .padding(12)
                    .background(.textField)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                TextField("", text: $seconds, prompt: Text("წმ").foregroundStyle(.gray.opacity(0.5)))
                    .padding(12)
                    .background(.textField)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            .multilineTextAlignment(.center)
            
            Button {
                let h = Int(hours) ?? 0
                let m = Int(minutes) ?? 0
                let s = Int(seconds) ?? 0
                
                viewModel.addTimer(title: title, hours: h, minutes: m, seconds: s)
                
                title = ""
                hours = ""
                minutes = ""
                seconds = ""
                
            } label: {
                Text("დამატება")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal, 20)
        .font(.footnote)
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .background(.timerBackground)
        .ignoresSafeArea()
    }
}

#Preview {
    TimerView()
}
