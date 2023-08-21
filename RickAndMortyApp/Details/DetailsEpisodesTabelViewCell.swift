//
//  DetailsEpisodesTabelViewCell.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 19.08.2023.
//

import UIKit

final class DetailsEpisodesTabelViewCell: UITableViewCell {
    
    static let reuseID = "DetailsEpisodesTabelViewCell"
    
    private let detailsEpisodesView: UIView = {
        let detailsEpisodesView = UIView()
        detailsEpisodesView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1)
        detailsEpisodesView.layer.cornerRadius = 16
        detailsEpisodesView.translatesAutoresizingMaskIntoConstraints = false
        return detailsEpisodesView
    }()
    
    private let detailsEpisodesNameLabel: UILabel = {
        let detailsEpisodesNameLabel = UILabel()
        detailsEpisodesNameLabel.text = "Pilot"
        detailsEpisodesNameLabel.font = UIFont.systemFont(ofSize: 17)
        detailsEpisodesNameLabel.textColor = .white
        detailsEpisodesNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsEpisodesNameLabel
    }()
    
    private let detailsEpisodesNumberLabel: UILabel = {
        let detailsEpisodesNumberLabel = UILabel()
        detailsEpisodesNumberLabel.text = "Episode:1, Season:1"
        detailsEpisodesNumberLabel.textColor = .green
        detailsEpisodesNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsEpisodesNumberLabel.font = UIFont.systemFont(ofSize: 13)
        return detailsEpisodesNumberLabel
    }()
    
    private let detailsEpisodesDateLabel: UILabel = {
        let detailsEpisodesDateLabel = UILabel()
        detailsEpisodesDateLabel.text = "December 2, 2013"
        detailsEpisodesDateLabel.textColor = .white
        detailsEpisodesDateLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsEpisodesDateLabel.font = UIFont.systemFont(ofSize: 13)
        return detailsEpisodesDateLabel
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
        contentView.addSubview(detailsEpisodesView)
        detailsEpisodesView.addSubview(detailsEpisodesNameLabel)
        detailsEpisodesView.addSubview(detailsEpisodesNumberLabel)
        detailsEpisodesView.addSubview(detailsEpisodesDateLabel)
        
        NSLayoutConstraint.activate([
            detailsEpisodesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsEpisodesView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsEpisodesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsEpisodesView.heightAnchor.constraint(equalToConstant: 86),
            
            detailsEpisodesNameLabel.leadingAnchor.constraint(equalTo: detailsEpisodesView.leadingAnchor, constant: 15),
            detailsEpisodesNameLabel.topAnchor.constraint(equalTo: detailsEpisodesView.topAnchor, constant: 20),
            
            detailsEpisodesNumberLabel.leadingAnchor.constraint(equalTo: detailsEpisodesView.leadingAnchor, constant: 15),
            detailsEpisodesNumberLabel.topAnchor.constraint(equalTo: detailsEpisodesNameLabel.bottomAnchor, constant: 15),
            
            detailsEpisodesDateLabel.trailingAnchor.constraint(equalTo: detailsEpisodesView.trailingAnchor, constant: -15),
            detailsEpisodesDateLabel.topAnchor.constraint(equalTo: detailsEpisodesNameLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func configure(model: CharacterWithEpisode) {
//        detailsEpisodesNameLabel.text = model.
    }
}
