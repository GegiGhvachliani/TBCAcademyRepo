//
//  ButtonExtension.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

extension UIButton {
    static func customButton(imageName: String) -> UIButton {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.background.imageContentMode = .scaleAspectFill
        config.image = UIImage(named: imageName)
        config.baseForegroundColor = .label
        config.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7)
        button.configuration = config
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = ScreenSize.width * (30 / 375)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

