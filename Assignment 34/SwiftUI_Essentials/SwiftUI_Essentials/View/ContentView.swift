//
//  ContentView.swift
//  wavarjishabaSwiftUI
//
//  Created by Gegi Ghvachliani on 20.11.25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            ZStack{
                Image("AraevropuliCxeni")
                    .frame(width: 120, height: 120)
                    .background(.white)
                    .cornerRadius(60)
                
                Text(viewModel.isOnline ? "Online" : "Offline")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .padding(.horizontal, 7)
                    .padding(.vertical, 5)
                    .background(viewModel.isOnline ? .online : .offline)
                    .cornerRadius(15)
                    .padding(.top, 95)
                    .padding(.leading, 75)
            }
            
            Text("Araevropuli Cxeni")
                .font(.system(size: 18))
                .bold()
                .foregroundStyle(.white)
            
            Text("iOS Developer")
                .font(.system(size: 13))
                .bold()
                .foregroundStyle(Color.white.opacity(0.8))
            
            HStack {
                ForEach(viewModel.systemImageNames.indices) { index in
                    Button {
                        print("\(index)")
                    } label: {
                        Image(systemName: viewModel.systemImageNames[index])
                    }
                    .buttonStyle(Custom.ButtonStyle())
                }
            }
            
            VStack(alignment: .listRowSeparatorLeading) {
                Text("Skills")
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.leading)
                
                VStack {
                    ForEach(viewModel.skills.indices) { index in
                        Text("• \(viewModel.skills[index])")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                            .opacity(0.9)
                            .multilineTextAlignment(.leading)
                            .frame(width: 270, alignment: .leading)
                            .padding(.top, 0.1)
                    }
                }.padding(.leading)
            }
            .frame(alignment: .leading)
            .padding(.top, 7)
            
            HStack{
                Text(viewModel.isOnline ? "Set Offline" : "Set Online")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
                Toggle("", isOn: $viewModel.isOnline)
                    .labelsHidden()
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.3))
            .cornerRadius(25)
            .padding(.top, 30)
        }
        .frame(width: 300, height: 500)
        .background(LinearGradient(colors: [.gradientBlue, .gradientPurple],
                                   startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.7))
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    ContentView()
}
