//
//  CharactersPresenter.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import Foundation

protocol CharactersPresentorProtocol: AnyObject {
    var viewController: CharactersViewControllerProtocol? { get set }

    func getCharacters()
}

final class CharactersPresenter: CharactersPresentorProtocol{
    weak var viewController: CharactersViewControllerProtocol?

    func getCharacters() {
        MainService.shared.getCharacters { [weak self] characters in
            self?.viewController?.charactersInfo(info: characters)
        }
    }
}
