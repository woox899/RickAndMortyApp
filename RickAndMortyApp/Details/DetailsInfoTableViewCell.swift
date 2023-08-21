//
//  DetailsInfoTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 18.08.2023.
//

import UIKit

final class DetailsInfoTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailsCharactersInfoTableViewCell"
    
    //MARK: - Лейблы
    private let detailsInfoView: UIView = {
        let detailsInfoView = UIView()
        detailsInfoView.layer.cornerRadius = 16
        detailsInfoView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1)
        detailsInfoView.translatesAutoresizingMaskIntoConstraints = false
        return detailsInfoView
    }()
    
    private let detailsInfoSpeciesLabel: UILabel = {
        let detailsInfoSpeciesLabel = UILabel()
        detailsInfoSpeciesLabel.text = "Species:"
        detailsInfoSpeciesLabel.font = UIFont.systemFont(ofSize: 16)
        detailsInfoSpeciesLabel.textColor = .white
        detailsInfoSpeciesLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsInfoSpeciesLabel
    }()
    
    private let detailsInfoTypeLabel: UILabel = {
        let detailsInfoTypeLabel = UILabel()
        detailsInfoTypeLabel.text = "Type:"
        detailsInfoTypeLabel.font = UIFont.systemFont(ofSize: 16)
        detailsInfoTypeLabel.textColor = .white
        detailsInfoTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsInfoTypeLabel
    }()
    
    private let detailsInfoGenderLabel: UILabel = {
        let detailsInfoGenderLabel = UILabel()
        detailsInfoGenderLabel.text = "Gender:"
        detailsInfoGenderLabel.font = UIFont.systemFont(ofSize: 16)
        detailsInfoGenderLabel.textColor = .white
        detailsInfoGenderLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsInfoGenderLabel
    }()
    //MARK: - Значения лейблов
    private let detailsInfoSpeciesDescriptionLabel: UILabel = {
        let detailsInfoSpeciesDescriptionLabel = UILabel()
        detailsInfoSpeciesDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        detailsInfoSpeciesDescriptionLabel.textColor = .white
        detailsInfoSpeciesDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsInfoSpeciesDescriptionLabel.textAlignment = .right
        return detailsInfoSpeciesDescriptionLabel
    }()
    
    private let detailsInfoTypeDescriptionLabel: UILabel = {
        let detailsInfoTypeDescriptionLabel = UILabel()
        detailsInfoTypeDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        detailsInfoTypeDescriptionLabel.adjustsFontSizeToFitWidth = true
        detailsInfoTypeDescriptionLabel.textColor = .white
        detailsInfoTypeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsInfoTypeDescriptionLabel.textAlignment = .right
        return detailsInfoTypeDescriptionLabel
    }()
    
    private let detailsInfoGenderDescriptionLabel: UILabel = {
        let detailsInfoGenderDescriptionLabel = UILabel()
        detailsInfoGenderDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        detailsInfoGenderDescriptionLabel.textColor = .white
        detailsInfoGenderDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsInfoGenderDescriptionLabel.textAlignment = .right
        return detailsInfoGenderDescriptionLabel
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
        contentView.addSubview(detailsInfoView)
        detailsInfoView.addSubview(detailsInfoSpeciesLabel)
        detailsInfoView.addSubview(detailsInfoTypeLabel)
        detailsInfoView.addSubview(detailsInfoGenderLabel)
        detailsInfoView.addSubview(detailsInfoSpeciesDescriptionLabel)
        detailsInfoView.addSubview(detailsInfoTypeDescriptionLabel)
        detailsInfoView.addSubview(detailsInfoGenderDescriptionLabel)
        
        NSLayoutConstraint.activate([
            detailsInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsInfoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsInfoView.heightAnchor.constraint(equalToConstant: 124),
            
            detailsInfoSpeciesLabel.leadingAnchor.constraint(equalTo: detailsInfoView.leadingAnchor, constant: 20),
            detailsInfoSpeciesLabel.topAnchor.constraint(equalTo: detailsInfoView.topAnchor, constant: 15),
            
            detailsInfoTypeLabel.leadingAnchor.constraint(equalTo: detailsInfoView.leadingAnchor, constant: 20),
            detailsInfoTypeLabel.topAnchor.constraint(equalTo: detailsInfoSpeciesLabel.bottomAnchor, constant: 15),
            
            detailsInfoGenderLabel.leadingAnchor.constraint(equalTo: detailsInfoView.leadingAnchor, constant: 20),
            detailsInfoGenderLabel.topAnchor.constraint(equalTo: detailsInfoTypeLabel.bottomAnchor, constant: 15),
            
            detailsInfoSpeciesDescriptionLabel.topAnchor.constraint(equalTo: detailsInfoView.topAnchor, constant: 15),
            detailsInfoSpeciesDescriptionLabel.trailingAnchor.constraint(equalTo: detailsInfoView.trailingAnchor, constant: -20),
            detailsInfoSpeciesDescriptionLabel.leadingAnchor.constraint(equalTo: detailsInfoSpeciesLabel.trailingAnchor, constant: 20),
            
            detailsInfoTypeDescriptionLabel.topAnchor.constraint(equalTo: detailsInfoSpeciesDescriptionLabel.bottomAnchor, constant: 15),
            detailsInfoTypeDescriptionLabel.leadingAnchor.constraint(equalTo: detailsInfoView.leadingAnchor, constant: 100),
            detailsInfoTypeDescriptionLabel.trailingAnchor.constraint(equalTo: detailsInfoView.trailingAnchor, constant: -20),
            
            detailsInfoGenderDescriptionLabel.topAnchor.constraint(equalTo: detailsInfoTypeDescriptionLabel.bottomAnchor, constant: 15),
            detailsInfoGenderDescriptionLabel.leadingAnchor.constraint(equalTo: detailsInfoGenderLabel.trailingAnchor, constant: 20),
            detailsInfoGenderDescriptionLabel.trailingAnchor.constraint(equalTo: detailsInfoView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure(model: CharacterWithEpisode) {
        detailsInfoSpeciesDescriptionLabel.text = model.character.species?.rawValue
        if let type = model.character.type, !type.isEmpty {
            detailsInfoTypeDescriptionLabel.text = type
        } else {
            detailsInfoTypeDescriptionLabel.text = "None"
        }
        
        detailsInfoGenderDescriptionLabel.text = model.character.gender?.rawValue
    }
}

