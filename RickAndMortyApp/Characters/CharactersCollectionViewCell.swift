//
//  CharactersCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import UIKit
import Kingfisher

final class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "CharactersCardCollectionViewCell"
    
    private var model: Character?
    
    private let charactersView: UIView = {
        let charactersView = UIView()
        charactersView.layer.cornerRadius = 18
        charactersView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1)
        charactersView.translatesAutoresizingMaskIntoConstraints = false
        return charactersView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Rick")
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Character?) {
        self.model = model
        nameLabel.text = model?.name
        if let charImage = model?.image, let imageURL = URL(string: charImage) {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    private func setupUI() {
        addSubview(charactersView)
        addSubview(imageView)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            charactersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersView.topAnchor.constraint(equalTo: topAnchor),
            charactersView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}
