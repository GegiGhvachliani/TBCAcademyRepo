//
//  Protocols.swift
//  MultithreadingAndConcurrency
//
//  Created by ATitberidze on 10/30/25.
//

import UIKit

protocol NetworkManaging {
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}

protocol ImageProcessing {
    func applyFilter(to image: UIImage, completion: @escaping (UIImage) -> Void)
}
