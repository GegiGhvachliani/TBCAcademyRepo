//
//  ContentView.swift
//  SwiftUIEssentials2
//
//  Created by Gegi Ghvachliani on 21.11.25.
//

import SwiftUI

struct ContentView: View {
    @State var randomColor: Color = .juzonebi
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ZStack(alignment: .topLeading){
                Color.screenBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 4) {
                    Text("SwiftUI Essentials")
                        .fontWeight(.bold)
                        .font(Font.system(size: 34))
                        .foregroundStyle(.white)
                    
                    HStack(spacing: 13) {
                        JuzonebiView()
                        
                        VStack(spacing: 12) {
                            ChataobaView()
                            CecxlovaniNewsView()
                        }
                    }
                    .padding(.horizontal, 9)
                    
                    
                    InvoicesList()
                        .padding(.top, 16)
                        .padding(.horizontal, 0)
                }
            }
            
            Button {
                let randomRed = Double.random(in: 0..<1)
                let randomGreen = Double.random(in: 0..<1)
                let randomBlue = Double.random(in: 0..<1)
                
                randomColor = Color(red: randomRed, green: randomGreen, blue: randomBlue)
            } label: {
                Image("RestartSymbol")
                    .resizable()
                    .frame(width: 16,
                           height: 16
                    )
                    .padding()
                    .background(randomColor)
                    .cornerRadius(25)
                
            }
            .padding(.trailing, 25)
            .padding(.bottom, 30)
        }
    }
}


#Preview {
    ContentView()
}
