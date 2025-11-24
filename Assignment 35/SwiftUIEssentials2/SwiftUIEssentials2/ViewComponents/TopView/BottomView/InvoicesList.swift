//
//  InvoicesList.swift
//  SwiftUIEssentials2
//
//  Created by Gegi Ghvachliani on 21.11.25.
//
import SwiftUI

struct InvoicesList: View {
    struct Invoice: Identifiable {
        var id = UUID()
        
        var title: String
        var Description: String
    }
    
    private var invoices: [Invoice] = [
        Invoice(title: "Career Advancement Guide ვორკშოპი",
                Description: "დაესწარით აუცილელად, ესეც (როგორც წინა) ძაან გამოგადგებათ"),
        Invoice(title: "რატომ გვქონდა MVVM SwiftUI-ში?",
                Description: "კარგია წინასწარ თუ მოვიკვლევთ ხოლმე და რო აგვიხსნიან მერე უფრო გაჯდება (ან უბრალოდ აკაკიმ დავალების წერისას ბევრი მოინდომა :დ)"),
        Invoice(title: "გამითავდა ტექსტები",
                Description: "რაღაცა პატარა ტექსტი"),
        Invoice(title: "ვის უკბინა ძაღლმა?",
                Description: "აიოს დეველოპერს ძაღლმა უკბინა და აიცრა"),
        Invoice(title: "რატომ გვხარშავს ყველას თათა?",
                Description: "ქვაბი დადგმულია და მზად ვართ ჩასასხდომათ, ტემპერატურა იდეალური")
    ]
    
    var body: some View {
        let width: CGFloat = 375
        let height: CGFloat = 60
        List(invoices) { invoice in
            HStack(spacing: 17) {
                Image("InvoiceSymbol")
                    .resizable()
                    .scaledToFit()
                    .frame(width: height * 0.67,
                           height: height * 0.67,
                    )
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(invoice.title)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(Font.system(size: height * 0.2))
                        .frame(width: width * 0.68, alignment: .leading)
                    
                    Text(invoice.Description)
                        .foregroundStyle(.white, .secondary)
                        .font(Font.system(size: height * 0.16))
                        .frame(width: width * 0.68, alignment: .leading)
                    
                }
            }
            .padding(.horizontal, 8)
            .frame(height: height - 6)
            .listRowBackground(Color.screenBackground)
            .listRowSeparatorTint(.gray)
            .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                return -viewDimensions.width
            }
            .listRowSeparator(invoice.id == invoices.last?.id ? .hidden : .visible, edges: .bottom)
            
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.clear)
        
    }
}

#Preview {
    InvoicesList()
}
