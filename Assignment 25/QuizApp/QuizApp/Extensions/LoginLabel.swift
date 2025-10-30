//
//  LoginLabel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

extension UILabel {
    static func LoginLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: ScreenSize.height * 0.02, weight: .semibold)
        label.textAlignment = .left
        
        return label
    }
}
