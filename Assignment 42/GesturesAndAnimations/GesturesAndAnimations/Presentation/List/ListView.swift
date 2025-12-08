//
//  Untitled.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    @State private var name = ""
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                ParticipantsList(
                    participants: viewModel.participantsList.participants,
                    onDelete: { participant in
                        viewModel.deleteParticipant(name: participant)
                    }
                )
                
                ParticipantsAdderView(name: $name) { participant in
                    viewModel.addParticipant(name: participant)
                }
            }
        }
    }
}

#Preview {
    MainView()
}

struct ParticipantsList: View {
    var participants: [String]
    var onDelete: (String) -> ()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(participants, id: \.self) { participant in
                    Text(participant)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .gesture(
                            LongPressGesture(minimumDuration: 2.0)
                                .onEnded { _ in
                                onDelete(participant)
                            }
                        )
                }
            }
        }
    }
}

struct ParticipantsAdderView: View {
    @Binding var name: String
    var onAdd: (String) -> ()
    var body: some View {
        HStack(spacing: 20){
            TextField("სახელი...", text: $name)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .background(.red)
            
            Button {
                if !name.isEmpty {
                    onAdd(name)
                    name = ""
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(width: 30)
        }
        .frame(height: 30)
        .padding(30)
    }
}
