//
//  CountryCell.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit
import TinyConstraints
import Networking
import CommonUIComponents

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
        
        // MARK: TinyConstraints
        
        // ContainerForCell
        ContainerForCell.edgesToSuperview(insets: .init(top: 5, left: 20, bottom: 5, right: 20))
                                          
        // flagView
        flagView.leading(to: ContainerForCell, offset: 16)
        flagView.top(to: ContainerForCell, offset: 16)
        flagView.height(ScreenSize.height * 0.03)
        flagView.width(ScreenSize.width * 0.09)
        
        // nameLabel
        nameLabel.top(to: ContainerForCell, offset: 16)
        nameLabel.trailingToLeading(of: arrowIcon, offset: -10)
        
        // arrowIcon
        arrowIcon.top(to: nameLabel)
        arrowIcon.trailing(to: ContainerForCell, offset: -16)
        arrowIcon.width(ScreenSize.width * 0.05)
        arrowIcon.height(to: arrowIcon, arrowIcon.widthAnchor)
        arrowIcon.centerY(to: nameLabel)
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
