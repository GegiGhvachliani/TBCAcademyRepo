//
//  CountryCell.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 22.10.25.
//

import UIKit

class CountryCell: UITableViewCell {

    private var containerForCell: UIView = UIView()
    private var countryFlagImage: UIImageView = UIImageView()
    private var navigationSymbolImage: UIImageView = UIImageView()
    private var labelForCountry: UILabel = UILabel()
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func setupUI() {
        setupContainerForCell()
        setupContainerForCell()
        setupCountryFlagImage()
        setupNavigationSymbolImage()
        setupLabelForCountry()
    }
    
    private func setupContainerForCell() {
        contentView.addSubview(containerForCell)
        containerForCell.translatesAutoresizingMaskIntoConstraints = false
        
        containerForCell.backgroundColor = .systemBackground
        containerForCell.layer.cornerRadius = 25
        containerForCell.clipsToBounds = true
        containerForCell.layer.borderWidth = 1
        containerForCell.layer.borderColor = UIColor.black.cgColor
        
        NSLayoutConstraint.activate([
            containerForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            containerForCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            containerForCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            containerForCell.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCountryFlagImage() {
        containerForCell.addSubview(countryFlagImage)
        countryFlagImage.translatesAutoresizingMaskIntoConstraints = false
        
        countryFlagImage.contentMode = .scaleAspectFill
        countryFlagImage.layer.cornerRadius = 4
        countryFlagImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            countryFlagImage.centerYAnchor.constraint(equalTo: containerForCell.centerYAnchor),
            countryFlagImage.leadingAnchor.constraint(equalTo: containerForCell.leadingAnchor, constant: 24),
            countryFlagImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 30 / 375),
            countryFlagImage.heightAnchor.constraint(equalTo: countryFlagImage.widthAnchor, multiplier: 2 / 3),
        ])
    }
    
    private func setupNavigationSymbolImage() {
        containerForCell.addSubview(navigationSymbolImage)
        navigationSymbolImage.translatesAutoresizingMaskIntoConstraints = false
        
        navigationSymbolImage.image = UIImage(named: "navigationSymbol")
        navigationSymbolImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            navigationSymbolImage.centerYAnchor.constraint(equalTo: containerForCell.centerYAnchor),
            navigationSymbolImage.trailingAnchor.constraint(equalTo: containerForCell.trailingAnchor, constant: -20),
            navigationSymbolImage.widthAnchor.constraint(equalToConstant: 10),
            navigationSymbolImage.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    private func setupLabelForCountry() {
        containerForCell.addSubview(labelForCountry)
        labelForCountry.translatesAutoresizingMaskIntoConstraints = false
        
        labelForCountry.textAlignment = .right
        labelForCountry.textColor = .black
        labelForCountry.numberOfLines = 0
        labelForCountry.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
            labelForCountry.trailingAnchor.constraint(equalTo: navigationSymbolImage.leadingAnchor, constant: -5),
            labelForCountry.centerYAnchor.constraint(equalTo: containerForCell.centerYAnchor),
            labelForCountry.heightAnchor.constraint(equalToConstant: 18),
       t
        ])
    }
    
    func configureCellWith(country: CountryModel) {
    countryFlagImage.image = UIImage(named: country.name)
    labelForCountry.text = country.name
}
}


#Preview {
    CountriesListVC()
}
