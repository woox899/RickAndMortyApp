//
//  DetailsNameTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 18.08.2023.
//

import UIKit
import Kingfisher

final class DetailsNameTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailsNameTableViewCell"
    
    private let detailsImageView: UIImageView = {
        let detailsImageView = UIImageView()
        detailsImageView.translatesAutoresizingMaskIntoConstraints = false
        detailsImageView.layer.cornerRadius = 16
        detailsImageView.clipsToBounds = true
        return detailsImageView
    }()
    
    private let detailsNameLabel: UILabel = {
        let detailsNameLabel = UILabel()
        detailsNameLabel.font = UIFont.systemFont(ofSize: 22)
        detailsNameLabel.textAlignment = .center
        detailsNameLabel.textColor = .white
        detailsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsNameLabel
    }()
    
    private let detailsStatusLabel: UILabel = {
        let detailsStatusLabel = UILabel()
        detailsStatusLabel.textColor = .green
        detailsStatusLabel.font = UIFont.systemFont(ofSize: 16)
        detailsStatusLabel.textAlignment = .center
        detailsStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsStatusLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseID)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(detailsImageView)
        contentView.addSubview(detailsNameLabel)
        contentView.addSubview(detailsStatusLabel)
        contentView.backgroundColor = UIColor(red: 3/255, green: 12/255, blue: 30/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            detailsImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            detailsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            detailsImageView.heightAnchor.constraint(equalToConstant: 148),
            detailsImageView.widthAnchor.constraint(equalToConstant: 148),
            
            detailsNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            detailsNameLabel.topAnchor.constraint(equalTo: detailsImageView.bottomAnchor, constant: 10),
            
            detailsStatusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            detailsStatusLabel.topAnchor.constraint(equalTo: detailsNameLabel.bottomAnchor, constant: 5)
        ])
    }
    
    func configure(model: CharacterWithEpisode) {
        detailsNameLabel.text = model.character.name
        detailsStatusLabel.text = model.character.status?.rawValue
        if let charImage = model.character.image, let imageURL = URL(string: charImage) {
            detailsImageView.kf.setImage(with: imageURL)
        }
    }
}
