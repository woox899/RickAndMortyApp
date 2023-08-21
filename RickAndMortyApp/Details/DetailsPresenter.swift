//
//  DetailsPresenter.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    var viewController: DetailsViewControllerProtocol? { get set }
}

final class DetailsPresenter: DetailsPresenterProtocol {
    weak var viewController: DetailsViewControllerProtocol?
    
    
}
