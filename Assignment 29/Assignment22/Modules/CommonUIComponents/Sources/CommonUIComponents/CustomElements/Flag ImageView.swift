//
//  ScreenSize.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//
import UIKit

extension UIImageView {
    public func load(with url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
