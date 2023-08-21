//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import UIKit

protocol CharactersViewControllerProtocol: AnyObject {
    func charactersInfo(info: [CharacterWithEpisode])
}

final class CharactersViewController: UIViewController, CharactersViewControllerProtocol, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let presenter: CharactersPresentorProtocol
    private var charactersArray = [CharacterWithEpisode]()
    
    private lazy var charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 156, height: 202)
        layout .minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.reuseID)
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 20)
        collectionView.backgroundColor = UIColor(red: 3/255, green: 12/255, blue: 30/255, alpha: 1)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.getCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    init(presenter: CharactersPresentorProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func charactersInfo(info: [CharacterWithEpisode]) {
        charactersArray = info
        charactersCollectionView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(charactersCollectionView)
        
        NSLayoutConstraint.activate([
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.reuseID, for: indexPath) as! CharactersCollectionViewCell
        if !charactersArray.isEmpty {
            cell.configure(model: charactersArray[indexPath.row].character)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToDetailsViewController(model: charactersArray[indexPath.row])
    }
    
    private func goToDetailsViewController(model: CharacterWithEpisode) {
        let detailsPresenter: DetailsPresenterProtocol = DetailsPresenter()
        let secondVC: DetailsViewControllerProtocol = DetailsViewController(presenter: detailsPresenter, model: model)
        detailsPresenter.viewController = secondVC
        navigationController?.pushViewController(secondVC as! UIViewController, animated: true)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.backgroundColor = UIColor(red: 3/255, green: 12/255, blue: 30/255, alpha: 1)
        navigationItem.title = "Characters"
    }
}
