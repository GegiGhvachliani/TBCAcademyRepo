//
//  TableHeader.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Merriweather-Black", size: ScreenSize.width * 0.05)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderLabel() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configureWith(title: String) {
        self.label.text = title
    }
}
