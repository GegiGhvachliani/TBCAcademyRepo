//
//  JuzonebiView.swift
//  SwiftUIEssentials2
//
//  Created by Gegi Ghvachliani on 21.11.25.
//

import SwiftUI

struct JuzonebiView: View {
    var width: CGFloat = 165
    var height: CGFloat = 232
    
    private var musicTitles = [
        "წაღვერი და თბილისი",
        "წყალტუბო და ქუთაისი",
        "ჩემო თბილის ქალაქო",
        "ჩემი საჩხერე და იმერეთი",
        "ჰიმნი ქუთაისს",
        "სიმღერა1",
        "სიმღერა2",
        "სიმღერა3",
        "სიმღერა4",
        "სიმღერა5",
        "სიმღერა6"
    ]
    
    @State var MusicName: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("JuzonebiBackground")
                .frame(width: width,
                       height: height
                )
                .cornerRadius(18)
            
            VStack(alignment: .leading) {
                Button {
                    MusicName = musicTitles.randomElement() ?? ""
                } label: {
                    Image("JuzonebiSymbol")
                        .resizable()
                        .frame(width: width * 0.19,
                               height: width * 0.19
                        )
                }
                Text("ჯუზონები და რამე")
                    .fontWeight(.medium)
                    .font(Font.system(size: height * 0.04))
                    .foregroundStyle(.white)
                
                Text(MusicName)
                    .bold()
                    .font(Font.system(size: height * 0.073))
                    .padding(.top, height * 0.25)
                    .foregroundStyle(.white)
                    .frame(width: width - 81)
            }
            .padding(.top, 12)
            .padding(.leading, 16)
        }
    }
}

#Preview {
    JuzonebiView()
}



