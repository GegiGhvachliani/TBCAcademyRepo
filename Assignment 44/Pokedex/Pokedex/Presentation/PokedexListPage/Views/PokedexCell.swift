//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import UIKit

class PokedexCell: UICollectionViewCell {
    // MARK: Properties
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        
        return view
    }()
    
    private let shadowView: UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        
        shadow.backgroundColor = .systemGray6
        shadow.layer.cornerRadius = 12
        
        return shadow
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        
        return label
    }()
    
    private var currentImageURL: String?
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(shadowView)
        containerView.addSubview(idLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            shadowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            shadowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            shadowView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.42),
            
            idLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            idLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            imageView.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
            
        ])
    }
    
    func configure(with pokedex: PokedexListItem) {
        nameLabel.text = pokedex.name.capitalized
        idLabel.text = pokedex.formattedID
        
        let scale = pokedex.imageScale
        imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        imageView.image = nil
        currentImageURL = pokedex.imageURL
        loadImage(from: pokedex.imageURL)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        currentImageURL = urlString
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("load error: \(error)")
                return
            }
            
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                if self.currentImageURL == urlString {
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        idLabel.text = nil
        currentImageURL = nil
    }
}
