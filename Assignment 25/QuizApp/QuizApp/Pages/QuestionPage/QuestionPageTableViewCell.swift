//
//  QuestionPageTableViewCell.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class QuestionPageTableViewCell: UITableViewCell {
    
    private let containerForCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = ScreenSize.width * 0.04
        view.clipsToBounds = true
        
        return view
    }()
    private var checkmarkedOrNotImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(systemName: "circle")
        image.tintColor = .background
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = ScreenSize.width * 0.03
        
        return image
    }()
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: ScreenSize.width * 0.05, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .background
        label.textAlignment = .left
        label.text = "ragac pasuxi" //TODO: gasatania
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .background
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerForCell)
        containerForCell.addSubview(checkmarkedOrNotImage)
        containerForCell.addSubview(answerLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // containerForCell
            containerForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ScreenSize.width * 0.015),
            containerForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: ScreenSize.width * (-0.015)),
            containerForCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerForCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            // checkmarkedOrNotImage
            checkmarkedOrNotImage.leadingAnchor.constraint(equalTo: containerForCell.leadingAnchor, constant: ScreenSize.width * 0.046),
            checkmarkedOrNotImage.centerYAnchor.constraint(equalTo: containerForCell.centerYAnchor),
            checkmarkedOrNotImage.heightAnchor.constraint(equalTo: containerForCell.widthAnchor, multiplier: 0.06),
            checkmarkedOrNotImage.widthAnchor.constraint(equalTo: checkmarkedOrNotImage.heightAnchor),

            // answerLabel
            answerLabel.leadingAnchor.constraint(equalTo: checkmarkedOrNotImage.trailingAnchor, constant: ScreenSize.width * 0.046),
            answerLabel.centerYAnchor.constraint(equalTo: containerForCell.centerYAnchor),
            answerLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.734)
        ])
    }
    
    func configure(answer: String, isSelected: Bool, isCorrect: Bool?) {
        answerLabel.text = answer
        
        if  isSelected, let correct = isCorrect {
            checkmarkedOrNotImage.image = UIImage(systemName: correct ? "checkmark.circle.fill" : "checkmark.circle")
            checkmarkedOrNotImage.backgroundColor = correct ? .white : .button
            containerForCell.backgroundColor = .button
            answerLabel.textColor = .white
        }
    }
}
