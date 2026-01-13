//
//  Untitled.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import Combine

protocol ListViewModelProtocol {
    func addParticipant(name: String)
    func deleteParticipant(name: String)
}

class ListViewModel: ListViewModelProtocol, ObservableObject {
    @Published var participantsList: ListModel = ListModel()
    
    func addParticipant(name: String) {
        participantsList.participants.append(name)
    }
    
    func deleteParticipant(name: String) {
        participantsList.participants.removeAll {  $0 == name }
    }
}
