//
//  DependencyContainer.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//
import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()
    
    private let networkService: NetworkServiceProtocol
    
    private init() {
        self.networkService = NetworkService()
    }
    // MARK: - Character DIs
    func makeCharactersViewModel() -> CharactersViewModel {
        let repository = CharacterRepository(networkService: networkService)
        let getCharactersUseCase = GetCharactersUseCase(repository: repository)
        
        return CharactersViewModel(getCharactersUseCase: getCharactersUseCase)
    }
    
    func makeCharacterDetailsViewModel(character: Character) -> CharacterDetailsViewModel {
        let CharacterRepository = CharacterRepository(networkService: networkService)
        let EpisodeRepository = EpisodeRepository(networkService: networkService)
        let getEpisodesForCharacterUseCase = GetEpisodesForCharacterUseCase(repository: CharacterRepository)
        let getCharactersForEpisodeUsecase = GetCharactersForEpisodeUseCase(repository: EpisodeRepository)
        
        return CharacterDetailsViewModel(
            character: character,
            getEpisodesForCharacterUseCase: getEpisodesForCharacterUseCase,
            getCharactersForEpisodeUseCase: getCharactersForEpisodeUsecase
        )
    }
    
    func makeCharacterCoordinator() -> CharactersCoordinator {
        return CharactersCoordinator()
    }
    
    
    // MARK: - Episode DIs
    func makeEpisodesViewModel() -> EpisodesViewModel {
        let repository = EpisodeRepository(networkService: networkService)
        let getEpisodesUseCase = GetEpisodesUseCase(repository: repository)
        
        return EpisodesViewModel(getEpisodesUseCase: getEpisodesUseCase)
    }
    
    func makeEpisodeDetailsViewModel(episode: Episode) -> EpisodeDetailsViewModel {
        let repository = EpisodeRepository(networkService: networkService)
        let getCharactersForEpisodeUseCase = GetCharactersForEpisodeUseCase(repository: repository)
        
        return EpisodeDetailsViewModel(
            episode: episode,
            getCharactersForEpisodeUseCase: getCharactersForEpisodeUseCase
        )
    }
    
    func makeEpisodesCoordinator() -> EpisodesCoordinator {
        return EpisodesCoordinator()
    }
    
    // MARK: - Locations DIs
    func makeLocationsViewModel() -> LocationsViewModel {
        let repository = LocationRepository(networkService: networkService)
        let getLocationsUseCase = GetLocationsUseCase(repository: repository)
        
        return LocationsViewModel(getLocationsUseCase: getLocationsUseCase)
    }
    
    func makeLocationDetailsViewModel(location: Location) -> LocationDetailsViewModel {
        let repository = LocationRepository(networkService: networkService)
        let getResidentsForLocationUseCase = GetResidentsForLocationUseCase(repository: repository)
        
        return LocationDetailsViewModel(
            location: location,
            getResidentsForLocationUseCase: getResidentsForLocationUseCase)
    }
    
    func makeLocationsCoordinator() -> LocationsCoordinator {
        return LocationsCoordinator()
    }
    
    // MARK: - Search DIs
    func makeSearchViewModel() -> SearchViewModel {
        let characterRepository = CharacterRepository(networkService: networkService)
        let episodeRepository = EpisodeRepository(networkService: networkService)
        let locationRepository = LocationRepository(networkService: networkService)
        
        let searchCharacterUseCase = SearchCharacterUseCase(repository: characterRepository)
        let searchEpisodeUseCase = SearchEpisodeUseCase(repository: episodeRepository)
        let searchLocationUseCase = SearchLocationUseCase(repository: locationRepository)
        
        return SearchViewModel(
            searchCharacterUseCase: searchCharacterUseCase,
            searchEpisodeUseCase: searchEpisodeUseCase,
            searchLocationUseCase: searchLocationUseCase
        )
    }
    
}
