//
//  MainPageViewModel.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import Combine

protocol MainViewModelProtocol {
    var musics: [Music] { get }
    func loadMusics()
}
final class MainViewModel: ObservableObject, MainViewModelProtocol {
    @Published var musics: [Music] = []
    
    init() {
        loadMusics()
    }
    
    func loadMusics() {
        musics = [
            Music(title: "Tetnuldi", artistName: "Max 95", imageName: "LLTTFFRR", audioFileName: "Max.95 - Tetnuldi"),
            Music(title: "Lacrimosa", artistName: "Mozart", imageName: "mozart", audioFileName: "Mozart - Lacrimosa but humanity has ended"),
            Music(title: "Tank!", artistName: "Seatbelts", imageName: "tank", audioFileName: "Tank!"),
            Music(title: "The Longer I Wait", artistName: "Daniela Tourgeman", imageName: "longer", audioFileName: "The Longer I Wait"),
            Music(title: "Dies Irae", artistName: "Verdi", imageName: "verdi", audioFileName: "Verdis Requiem_ Dies irae"),
            Music(title: "Storm", artistName: "Vivaldi", imageName: "vivaldi", audioFileName: "Vivaldi   Storm"),
            Music(title: "აფხაზეთის მიწაზე", artistName: "Georgian Patriotic", imageName: "khalkhuri", audioFileName: "აფხაზეთის მიწაზე  Georgian Patriotic Song About Abkhazian War")
        ]
    }
}
