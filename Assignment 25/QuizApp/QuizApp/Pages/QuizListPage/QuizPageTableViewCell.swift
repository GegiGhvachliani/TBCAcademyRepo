//
//  QuizPageTableViewCell.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//
import UIKit

class QuizPageTableViewCell: UITableViewCell {
    private let containerForCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = ScreenSize.width * 0.038
        view.clipsToBounds = true
        view.backgroundColor = .systemBackground
        
        return view
    }()
    private let QuestionNumerationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: ScreenSize.height * 0.022, weight: .regular)
        label.textColor = .buttonText
        
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
        containerForCell.addSubview(QuestionNumerationLabel)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        // containerForCell
            containerForCell.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.height * 0.013),
        containerForCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ScreenSize.height * (-0.013)),
            containerForCell.leftAnchor.constraint(equalTo: leftAnchor, constant: ScreenSize.width * (0.0625)),
        containerForCell.rightAnchor.constraint(equalTo: rightAnchor, constant: ScreenSize.width * (-0.0625)),
        
        // labelForQuestionNumeration
        QuestionNumerationLabel.centerYAnchor.constraint(equalTo: containerForCell.centerYAnchor),
        QuestionNumerationLabel.centerXAnchor.constraint(equalTo: containerForCell.centerXAnchor)
        ])
    }
    
    func configure(questionNumber: QuizQuestionModel) {
        QuestionNumerationLabel.text = "Question \(questionNumber.questionNumber)"
    }
    
    
}
