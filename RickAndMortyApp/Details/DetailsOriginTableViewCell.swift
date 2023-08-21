//
//  DetailsOriginTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 19.08.2023.
//

import UIKit

final class DetailsOriginTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailsOriginTableViewCell"
    
    private let detailsOriginView: UIView = {
        let detailsOriginView = UIView()
        detailsOriginView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1)
        detailsOriginView.layer.cornerRadius = 16
        detailsOriginView.translatesAutoresizingMaskIntoConstraints = false
        return detailsOriginView
    }()
    
    private let detailsOriginPlanetView: UIView = {
        let detailsOriginPlanetView = UIView()
        detailsOriginPlanetView.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 42/255, alpha: 1)
        detailsOriginPlanetView.translatesAutoresizingMaskIntoConstraints = false
        detailsOriginPlanetView.layer.cornerRadius = 16
        return detailsOriginPlanetView
    }()
    
    private let detailsOriginPlanetImageView: UIImageView = {
        let detailsOriginPlanetImageView = UIImageView()
        detailsOriginPlanetImageView.image = UIImage(named: "Planet")
        detailsOriginPlanetImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailsOriginPlanetImageView
    }()
    
    private let detailaOriginPlanetNameLabel: UILabel = {
        let detailaOriginPlanetNameLabel = UILabel()
        detailaOriginPlanetNameLabel.textColor = .white
        detailaOriginPlanetNameLabel.font = UIFont.systemFont(ofSize: 17)
        detailaOriginPlanetNameLabel.adjustsFontSizeToFitWidth = true
        detailaOriginPlanetNameLabel.translatesAutoresizingMaskIntoConstraints  = false
        return detailaOriginPlanetNameLabel
    }()
    
    private let detailsOriginPlanetLabel: UILabel = {
        let detailsOriginPlanetLabel = UILabel()
        detailsOriginPlanetLabel.textColor = .green
        detailsOriginPlanetLabel.font = UIFont.systemFont(ofSize: 13)
        detailsOriginPlanetLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsOriginPlanetLabel.text = "Planet"
        return detailsOriginPlanetLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseID)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(red: 3/255, green: 12/255, blue: 30/255, alpha: 1)
        contentView.addSubview(detailsOriginView)
        detailsOriginView.addSubview(detailsOriginPlanetView)
        detailsOriginPlanetView.addSubview(detailsOriginPlanetImageView)
        detailsOriginView.addSubview(detailaOriginPlanetNameLabel)
        detailsOriginView.addSubview(detailsOriginPlanetLabel)
        
        NSLayoutConstraint.activate([
            detailsOriginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsOriginView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsOriginView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsOriginView.heightAnchor.constraint(equalToConstant: 80),
            
            detailsOriginPlanetView.leadingAnchor.constraint(equalTo: detailsOriginView.leadingAnchor, constant: 8),
            detailsOriginPlanetView.topAnchor.constraint(equalTo: detailsOriginView.topAnchor, constant: 8),
            detailsOriginPlanetView.heightAnchor.constraint(equalToConstant: 64),
            detailsOriginPlanetView.widthAnchor.constraint(equalToConstant: 64),
            
            detailsOriginPlanetImageView.leadingAnchor.constraint(equalTo: detailsOriginPlanetView.leadingAnchor, constant: 20),
            detailsOriginPlanetImageView.topAnchor.constraint(equalTo: detailsOriginPlanetView.topAnchor, constant: 20),
            detailsOriginPlanetImageView.heightAnchor.constraint(equalToConstant: 24),
            detailsOriginPlanetImageView.widthAnchor.constraint(equalToConstant: 24),
            
            detailaOriginPlanetNameLabel.leadingAnchor.constraint(equalTo: detailsOriginPlanetView.trailingAnchor, constant: 20),
            detailaOriginPlanetNameLabel.topAnchor.constraint(equalTo: detailsOriginView.topAnchor, constant: 20),
            detailaOriginPlanetNameLabel.trailingAnchor.constraint(equalTo: detailsOriginView.trailingAnchor, constant: -20),
            
            detailsOriginPlanetLabel.leadingAnchor.constraint(equalTo: detailsOriginPlanetView.trailingAnchor, constant: 20),
            detailsOriginPlanetLabel.topAnchor.constraint(equalTo: detailaOriginPlanetNameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(model: CharacterWithEpisode) {
        detailaOriginPlanetNameLabel.text = model.character.origin?.name
    }
}
