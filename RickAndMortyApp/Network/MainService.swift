//
//  MainService.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import Foundation

class MainService {
    
    static let shared = MainService()
    let mainUrlstring = "https://rickandmortyapi.com/api/"

    func getCharacters(complition: @escaping ([CharacterWithEpisode]) -> Void) {
        let path = mainUrlstring + "character"
        guard let url = URL(string: path) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data, let self else { return }
            if let charData = try? JSONDecoder().decode(CharactersModel.self, from: data) {
                DispatchQueue.main.async {
                    self.getEpizodes(complition: complition, charData: charData)
                }
            }
        }
        task.resume()
    }

    func getEpizodes(complition: @escaping ([CharacterWithEpisode]) -> Void, charData: CharactersModel) {
        let path = mainUrlstring + "episode"
        guard let url = URL(string: path) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let epizodes = try? JSONDecoder().decode(EpisodesModel.self, from: data) {
                DispatchQueue.main.async {
                    let characters = charData.results.map { char in
                        CharacterWithEpisode(
                            character: char,
                            epizodes: epizodes.results.filter { episode in
                                let episodeCharacter = String(char.id)
                                return episode.characters.contains(where: { $0.contains(episodeCharacter) })
                            }
                        )
                    }
                    complition(characters)
                }
            }
        }
        task.resume()
    }
}
