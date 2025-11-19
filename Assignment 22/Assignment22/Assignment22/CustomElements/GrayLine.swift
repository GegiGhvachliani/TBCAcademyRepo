//
//  GrayLine.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class GrayLine: UIView {
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemGray5
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
