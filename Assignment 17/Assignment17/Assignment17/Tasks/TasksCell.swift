//
//  TasksCell.swift
//  Assignment17
//
//  Created by Gegi Ghvachliani on 11.10.25.
//

import UIKit

class TasksCell: UITableViewCell {
    
    var taskLabel: UILabel = UILabel()
    var deadLineLabel: UILabel = UILabel()
    var calendarImage: UIImageView = UIImageView()
    var checkMarkImage: UIImageView = UIImageView()
    
    var containerView = UIView()
    var stripeColor = UIView()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        setupCellByConteiner()
        setupTaskLabel()
        setupCalendarImage()
        setupDeadlineLabel()
        setupCheckMarkImage()
        
    }
    
    private func setupCellByConteiner() {
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        setupStripeColor()
        
        contentView.backgroundColor = .viewBackground
        containerView.backgroundColor = .tableBackground
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setupStripeColor() {
        containerView.addSubview(stripeColor)
        stripeColor.translatesAutoresizingMaskIntoConstraints = false
        stripeColor.backgroundColor = .systemBlue
        
        containerView.addSubview(taskLabel)
        containerView.addSubview(deadLineLabel)
                
        NSLayoutConstraint.activate([
            stripeColor.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stripeColor.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            stripeColor.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            stripeColor.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * (15 / 430))
                ])
        
    }
    
    private func setupTaskLabel() {
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        
        taskLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height * (20 / 932)) //ფონტია შესაცლელი
        taskLabel.textColor = .label
        
        NSLayoutConstraint.activate([
            taskLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: UIScreen.main.bounds.height * (35 / 932)),
            taskLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: UIScreen.main.bounds.height * (9 / 932)),
            taskLabel.widthAnchor.constraint(equalToConstant: 300),
            taskLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupCalendarImage() {
        containerView.addSubview(calendarImage)
        calendarImage.translatesAutoresizingMaskIntoConstraints = false
        
        calendarImage.image = UIImage(named: "calendarImage")
        calendarImage.tintColor = .gray
        
        NSLayoutConstraint.activate([
            calendarImage.leadingAnchor.constraint(equalTo: taskLabel.leadingAnchor),
            calendarImage.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 0),
            calendarImage.widthAnchor.constraint(equalToConstant: 18),
            calendarImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    private func setupDeadlineLabel() {
        deadLineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        deadLineLabel.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.height * (14 / 932))
        deadLineLabel.textColor = .gray
// აქ კონფიგი შეგვიძლია
        
        NSLayoutConstraint.activate([
            deadLineLabel.leadingAnchor.constraint(equalTo: calendarImage.leadingAnchor, constant: 30),
            deadLineLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 45),
            
        ])
    }
    
    private func setupCheckMarkImage() {
        containerView.addSubview(checkMarkImage)
        checkMarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        checkMarkImage.image = UIImage(systemName: "checkmark.circle")
        checkMarkImage.tintColor = .black
        checkMarkImage.backgroundColor = .checkMark
        checkMarkImage.layer.cornerRadius = UIScreen.main.bounds.width * (15 / 430)
        checkMarkImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            checkMarkImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15),
            checkMarkImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            checkMarkImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 30 / 430),
            checkMarkImage.heightAnchor.constraint(equalTo: checkMarkImage.widthAnchor)
        ])
    }
    
    func configure(with task: Tasks) {
        
        taskLabel.text = task.todo
        deadLineLabel.text = task.completionDeadline
        
  
        stripeColor.backgroundColor = task.stripeColor
        
       
        let iconName = task.isCompleted ? "checkmark.circle" : "circle"
        checkMarkImage.image = UIImage(systemName: iconName)
        

        checkMarkImage.backgroundColor = task.isCompleted ? .checkMark : .tableBackground
    }
    
    
}

#Preview {
    MainVC()
}
