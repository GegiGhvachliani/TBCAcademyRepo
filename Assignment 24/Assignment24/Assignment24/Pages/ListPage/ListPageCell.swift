//
//  ListPageCell.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//

//Fimga-ში მოცემული დიზაინის ეკრანის ზომაა 375/812. მათ ვიყენებ გამყოფებად პროპორციის დასაცავად.
// ყველა წილადი არის ფიგმაში მოცემული კონკრეტული view-ის განზომილების შეფარდება ამ ზომებთან.

import UIKit

class ListPageCell: UITableViewCell {
    // MARK: Properties
    private let containerForCell = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.layer.cornerRadius = ScreenSize.width * 0.04
        container.clipsToBounds = true
        
        return container
    }()
    private let containerBackgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    private let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        
        return timeLabel
    }()
    private let infoTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        title.textColor = .white
        title.numberOfLines = 0
        title.textAlignment = .center
               
        return title
    }()
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        contentView.addSubview(containerForCell)
        containerForCell.addSubview(containerBackgroundImage)
        containerForCell.addSubview(timeLabel)
        containerForCell.addSubview(infoTitleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // containerViewForCell
            containerForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ScreenSize.height * 0.014),
            containerForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: ScreenSize.height * (-0.014)),
            containerForCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ScreenSize.width * 0.06),
            containerForCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ScreenSize.width * (-0.06)),
            
            // containerimage
            containerBackgroundImage.topAnchor.constraint(equalTo: containerForCell.topAnchor),
            containerBackgroundImage.bottomAnchor.constraint(equalTo: containerForCell.bottomAnchor),
            containerBackgroundImage.leftAnchor.constraint(equalTo: containerForCell.leftAnchor),
            containerBackgroundImage.rightAnchor.constraint(equalTo: containerForCell.rightAnchor),
            
            // timeLabel
            timeLabel.topAnchor.constraint(equalTo: containerForCell.topAnchor, constant: ScreenSize.height * 0.02),
            timeLabel.centerXAnchor.constraint(equalTo: containerForCell.centerXAnchor),
            
            // infoTitleLabel
            infoTitleLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor, constant: ScreenSize.height * 0.02),
            infoTitleLabel.centerXAnchor.constraint(equalTo: containerForCell.centerXAnchor),
            infoTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
            infoTitleLabel.heightAnchor.constraint(equalTo: containerForCell.heightAnchor, multiplier: 0.65)
        ])
    }
    
    func configureCellWith(news: NewsModel) {
        containerBackgroundImage.load(with: URL(string: news.photoUrl)!)
        timeLabel.text = news.time
        infoTitleLabel.text = news.title
        //infoTitleLabel.loadText(from: news.url)
    }

}

//#Preview {
//    ListPageCell()
//}
