//
//  DetailsViewController.swift
//  RickAndMortyApp
//
//  Created by Андрей Бабкин on 17.08.2023.
//

import UIKit

protocol DetailsViewControllerProtocol: AnyObject {

}

final class DetailsViewController: UIViewController, DetailsViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    private var presenter: DetailsPresenterProtocol
    private var model: CharacterWithEpisode
    
    private lazy var detailsTableView: UITableView = {
        let view = UITableView(frame: view.bounds, style: .plain)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.separatorStyle = UITableViewCell.SeparatorStyle.none
        view.register(DetailsNameTableViewCell.self, forCellReuseIdentifier: DetailsNameTableViewCell.reuseID)
        view.register(DetailsInfoTableViewCell.self, forCellReuseIdentifier: DetailsInfoTableViewCell.reuseID)
        view.register(DetailsOriginTableViewCell.self, forCellReuseIdentifier: DetailsOriginTableViewCell.reuseID)
        view.register(DetailsEpisodesTabelViewCell.self, forCellReuseIdentifier: DetailsEpisodesTabelViewCell.reuseID)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(presenter: DetailsPresenterProtocol, model: CharacterWithEpisode) {
        self.presenter = presenter
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return model.epizodes.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return headerLabel(text: "")
        case 1:
            return headerLabel(text: "Info")
        case 2:
            return headerLabel(text: "Origin")
        case 3:
            return headerLabel(text: "Epizodes")
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell {
            
            switch indexPath.section {
            case 0:
                let detailsImageCell = detailsTableView.dequeueReusableCell(withIdentifier: DetailsNameTableViewCell.reuseID, for: indexPath) as! DetailsNameTableViewCell
                detailsImageCell.configure(model: model)
                detailsImageCell.selectionStyle = .none
                return detailsImageCell
                
            case 1:
                let detailsInfoTableViewCell = detailsTableView.dequeueReusableCell(withIdentifier: DetailsInfoTableViewCell.reuseID, for: indexPath) as!
                DetailsInfoTableViewCell
                detailsInfoTableViewCell.configure(model: model)
                detailsInfoTableViewCell.selectionStyle = .none
                return detailsInfoTableViewCell
                
            case 2:
                let detailsOriginTableViewCell = detailsTableView.dequeueReusableCell(withIdentifier: DetailsOriginTableViewCell.reuseID, for: indexPath) as! DetailsOriginTableViewCell
                detailsOriginTableViewCell.configure(model: model)
                detailsOriginTableViewCell.selectionStyle = .none
                return detailsOriginTableViewCell
                
            case 3:
                let detailsEpisodesTabelViewCell = detailsTableView.dequeueReusableCell(withIdentifier: DetailsEpisodesTabelViewCell.reuseID, for: indexPath) as! DetailsEpisodesTabelViewCell
                detailsEpisodesTabelViewCell.configure(model: model)
                detailsEpisodesTabelViewCell.selectionStyle = .none
                return detailsEpisodesTabelViewCell
                
            default:
                return UITableViewCell()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 230
        case 1:
            return 124
        case 2:
            return 80
        case 3:
            return 106
        default:
            return 0
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 3/255, green: 12/255, blue: 30/255, alpha: 1)
        view.addSubview(detailsTableView)
        
        NSLayoutConstraint.activate([
            detailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            detailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            detailsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            detailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func headerLabel(text: String) -> UILabel {
        let infoSectionLabel: UILabel = {
            let infoSectionLabel = UILabel()
            infoSectionLabel.font = UIFont.systemFont(ofSize: 17)
            infoSectionLabel.text = text
            infoSectionLabel.textColor = .white
            return infoSectionLabel
        }()
        return infoSectionLabel
    }
}

