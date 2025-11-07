//
//
//  Labels.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//
import UIKit

class InfoLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: ScreenSize.width * 0.034, weight: .regular)
        self.textColor = .label
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TitleLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: ScreenSize.width * 0.04, weight: .bold)
        self.textColor = .label
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    class FlagInfoLabel: UILabel {
        init(text: String) {
            super.init(frame: .zero)
            self.text = text
            self.numberOfLines = 0
            self.lineBreakMode = .byWordWrapping
            self.font = .systemFont(ofSize: ScreenSize.width * 0.035, weight: .medium)
            self.textColor = .label
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

