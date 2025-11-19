//
//  CountryCell.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: - Properties
    private let ContainerForCell: UIView = UIView()
    
    private let flagView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Georgia")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = ScreenSize.height * (5 / 812)
        view.clipsToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Georgia"
        label.font = .systemFont(ofSize: ScreenSize.width * (14 / 375))
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.forward")
        view.tintColor = .label
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methots
    
    private func setupUI() {
        ContainerForCell.translatesAutoresizingMaskIntoConstraints = false
        ContainerForCell.layer.cornerRadius = ScreenSize.height * (25 / 812)
        ContainerForCell.layer.borderWidth = 1
        ContainerForCell.layer.borderColor = UIColor.black.cgColor
        ContainerForCell.clipsToBounds = true
        
        contentView.addSubview(ContainerForCell)
        ContainerForCell.addSubview(flagView)
        ContainerForCell.addSubview(nameLabel)
        ContainerForCell.addSubview(arrowIcon)
        
        NSLayoutConstraint.activate([
            // setup ContainerView
            ContainerForCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ContainerForCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ContainerForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            ContainerForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            // setup flag
            flagView.leadingAnchor.constraint(equalTo: ContainerForCell.leadingAnchor, constant: 16),
            flagView.topAnchor.constraint(equalTo: ContainerForCell.topAnchor, constant: 16),
            flagView.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.03),
            flagView.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.09),
            
            // setup name
            nameLabel.topAnchor.constraint(equalTo: ContainerForCell.topAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor, constant: -10),
            
            // setup arrow
            arrowIcon.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            arrowIcon.trailingAnchor.constraint(equalTo: ContainerForCell.trailingAnchor, constant: -16),
            arrowIcon.heightAnchor.constraint(equalTo: arrowIcon.widthAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.05),
            arrowIcon.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])
        
    }
    
    func configure(with country: Country) {
        nameLabel.text = country.name.common
        
        if let urlString = country.flag.png,
           let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.flagView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
}

#Preview {
    CountryCell()
}
