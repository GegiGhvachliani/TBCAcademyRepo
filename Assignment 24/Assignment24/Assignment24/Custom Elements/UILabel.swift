//
//  LabelExtension.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//

import UIKit

extension UILabel {
    static func createTitleLabelWith(title: String) -> UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }
}
