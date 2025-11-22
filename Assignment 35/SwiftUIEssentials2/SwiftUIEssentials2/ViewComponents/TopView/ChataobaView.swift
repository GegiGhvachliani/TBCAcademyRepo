//
//  ChataobaView.swift
//  SwiftUIEssentials2
//
//  Created by Gegi Ghvachliani on 21.11.25.
//

import SwiftUI

struct ChataobaView: View {
    private let width: CGFloat = 178
    private let height: CGFloat = 110
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 18)
                    .cornerRadius(18)
                    .foregroundStyle(.chataoba)
                    .frame(width: width,
                           height: height,
                           alignment: .bottomTrailing
                    )
                
                Image("ChataobaBackground")
                    .frame(width: width * 0.44,
                           height: width * 0.44,
                           alignment: .bottomTrailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            
            VStack(alignment: .leading) {
                Button {
                } label: {
                    Image("ChataobaSymbol")
                        .resizable()
                        .frame(width: width * 0.19,
                               height: width * 0.19
                        )
                }
                
                Text("ჩატაობა")
                    .fontWeight(.medium)
                    .font(Font.system(size: height * 0.08))
                    .foregroundStyle(.white)
            }
            .padding(.top, 12)
            .padding(.leading, 16)
        }
    }
}

#Preview {
    ChataobaView()
}
