//
//  CecxlovaniNewsView.swift
//  SwiftUIEssentials2
//
//  Created by Gegi Ghvachliani on 21.11.25.
//
import SwiftUI

struct CecxlovaniNewsView: View {
    private let width: CGFloat = 178
    private let height: CGFloat = 110
    
    @State var textColor: Color = .white
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ZStack(alignment: .bottomTrailing) {
                
                RoundedRectangle(cornerRadius: 18)
                    .cornerRadius(18)
                    .foregroundStyle(.cecxlovaniNews)
                    .frame(width: width,
                           height: height,
                           alignment: .bottomTrailing
                    )
                
                Image("CecxlovaniNewsBackground")
                    .frame(width: width * 0.44,
                           height: width * 0.44,
                           alignment: .bottomTrailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            
            VStack(alignment: .leading) {
                
                Button {
                    let randomRed = Double.random(in: 0...1)
                    let randomGreen = Double.random(in: 0...1)
                    let randomBlue = Double.random(in: 0...1)
                    textColor = Color(red: randomRed, green: randomGreen, blue: randomBlue)
                } label: {
                    Image("CecxlovaniNewsSymbol")
                        .resizable()
                        .frame(width: width * 0.19,
                               height: width * 0.19
                        )
                }
                
                Text("ცეცხლოვანი სიახლეები")
                    .fontWeight(.medium)
                    .font(Font.system(size: height * 0.08))
                    .frame(maxWidth: 110, alignment: .leading)
                    .foregroundStyle(Color(textColor))
            }
            .padding(.top, 12)
            .padding(.leading, 16)
        }
    }
}

#Preview {
    CecxlovaniNewsView()
}
