//
//  Untitled.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

// Figma-ში მოცემული დიზაინის ეკრანის ზომებია (320x606). შესაბამისად, პროპორციისთვის, ისინი გამოყენებულია სხვადასხვა View-ის ზომების გამყოფებად.
import UIKit

extension UITextField {
    static func loginTextField(with text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        textField.layer.cornerRadius = ScreenSize.width * 0.0375
        textField.backgroundColor = .systemBackground
        textField.textColor = .black
        textField.textAlignment = .left
        
        let padding = ScreenSize.width * 0.025
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 0))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 0))
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        
        return textField
    }
}
