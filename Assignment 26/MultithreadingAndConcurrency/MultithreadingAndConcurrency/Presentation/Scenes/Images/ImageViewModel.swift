//
//  ImageViewModel.swift
//  MultithreadingAndConcurrency
//
//  Created by ATitberidze on 10/30/25.
//

import Foundation
import UIKit

final class ImageViewModel {
    private let networkManager: NetworkManaging
    private let imageProcessor: ImageProcessing
    
    var onImagesUpdated: (() -> Void)?
    
    var images: [UIImage] = [] {
        didSet {
            onImagesUpdated?()
        }
    }
    
    private var imageUrls: [URL] = []
    
    init(
        networkManager: NetworkManaging = NetworkManager(),
        imageProcessor: ImageProcessing = ImageProcessor()
    ) {
        self.networkManager = networkManager
        self.imageProcessor = imageProcessor
    }
    
    // MARK: - თათას ბილეთები გაიცემა აქ
    
    // დაასრულეთ მეთოდის იმპლემენტაცია GCD-ის გამოყენებით (DispatchGroup)
    func fetchImagesWithGCD() {
        // არ დაგავიწყდეთ, გადმოწერილი იმიჯები საბოლოოდ უნდა მოხვდეს images მასივში.
        let group = DispatchGroup()
        var downloadedImages: [UIImage] = []
        
        for url in imageUrls {
            group.enter()
            fetchAndProcessImage(from: url) { image in
                if let image = image {
                    DispatchQueue.main.sync {
                        downloadedImages.append(image)
                    }
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.images = downloadedImages
        }
    }
    
    // დაასრულეთ მეთოდის იმპლემენტაცია NSOperationQueue-ის გამოყენებით
    func fetchImagesWithOperationQueue() {
        // არ დაგავიწყდეთ, გადმოწერილი იმიჯები საბოლოოდ უნდა მოხვდეს images მასივში.
        let blockOperation = BlockOperation()
        let queue = OperationQueue()
        var downloadedImages: [UIImage] = []
        
        blockOperation.qualityOfService = .userInteractive
        
        blockOperation.addExecutionBlock {
            let group = DispatchGroup()
            for url in self.imageUrls {
                group.enter()
                self.fetchAndProcessImage(from: url) { image in
                    if let image = image {
                        downloadedImages.append(image)
                    }
                    group.leave()
                }
            }
            group.wait()
        }
        blockOperation.completionBlock = {
            DispatchQueue.main.async {
                self.images = downloadedImages
            }
        }
        queue.addOperation(blockOperation)
    }
    
    // დაასრულეთ მეთოდის იმპლემენტაცია async/await-ის გამოყენებით (შეგიძლიათ დაიხმაროთ fetchAndProcessImageAsync())
    func fetchImagesWithAsyncAwait() {
        // არ დაგავიწყდეთ, გადმოწერილი იმიჯები საბოლოოდ უნდა მოხვდეს images მასივში.
        Task {
            var downloadedImages: [UIImage] = []
            
            for url in imageUrls {
                if let image = await fetchAndProcessImageAsync(from: url) {
                    downloadedImages.append(image)
                }
            }
            await MainActor.run {
                self.images = downloadedImages
            }
        }
    }
    
    func updateNumberOfImages(to count: Int) {
        generateImageUrls(numberOfImages: count)
    }
    
    private func generateImageUrls(numberOfImages: Int) {
        let maxImageNumber = 700
        var urls: [URL] = []
        
        for _ in 1...numberOfImages {
            let randomImageNumber = Int.random(in: 1...maxImageNumber)
            if let url = URL(string: "https://yavuzceliker.github.io/sample-images/image-\(randomImageNumber).jpg") {
                urls.append(url)
            }
        }
        
        self.imageUrls = urls
    }
    
    private func fetchAndProcessImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url else { return }
        networkManager.downloadImage(from: url) { [weak self] image in
            guard let self = self, let image = image else {
                completion(nil)
                return
            }
            self.imageProcessor.applyFilter(to: image) { processedImage in
                completion(processedImage)
            }
        }
    }
    
    private func fetchAndProcessImageAsync(from url: URL?) async -> UIImage? {
        await withCheckedContinuation { continuation in
            self.fetchAndProcessImage(from: url) { image in
                continuation.resume(returning: image)
            }
        }
    }
}
