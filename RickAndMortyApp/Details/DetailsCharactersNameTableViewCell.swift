//
//  DetailsNameTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 18.08.2023.
//

import UIKit

class DetailsNameTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailsCharactersNameTableViewCell"
    
    let detailsImageView: UIImageView = {
        let detailsImageView = UIImageView()
        detailsImageView.image = UIImage(named: "Rick")
        detailsImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailsImageView
    }()
    
    let detailsNameLabel: UILabel = {
        let detailsNameLabel = UILabel()
        detailsNameLabel.text = "Rick Sanchez"
        detailsNameLabel.font = UIFont.systemFont(ofSize: 22)
        detailsNameLabel.textAlignment = .center
        detailsNameLabel.textColor = .white
        detailsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsNameLabel
    }()
    
    let detailsStatusLabel: UILabel = {
        let detailsStatusLabel = UILabel()
        detailsStatusLabel.text = "Alive"
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
    
    func setupUI() {
        contentView.addSubview(detailsImageView)
        contentView.addSubview(detailsNameLabel)
        contentView.addSubview(detailsStatusLabel)
        contentView.backgroundColor = UIColor(red: 3/255, green: 12/255, blue: 30/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            detailsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 113),
            detailsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -113),
            detailsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            detailsImageView.heightAnchor.constraint(equalToConstant: 148),
            detailsImageView.widthAnchor.constraint(equalToConstant: 148),
            
            detailsNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 119),
            detailsNameLabel.topAnchor.constraint(equalTo: detailsImageView.bottomAnchor, constant: 10),
            detailsNameLabel.widthAnchor.constraint(equalToConstant: 138),
            detailsNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            detailsStatusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 170),
            detailsStatusLabel.topAnchor.constraint(equalTo: detailsNameLabel.bottomAnchor, constant: 5),
            detailsStatusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -170),
            detailsStatusLabel.heightAnchor.constraint(equalToConstant: 20),
            detailsStatusLabel.widthAnchor.constraint(equalToConstant: 34)
        ])
    }
}
