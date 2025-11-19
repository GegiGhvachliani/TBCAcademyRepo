//
//  APPOTMVC.swift
//  Assignment20
//
//  Created by Gegi Ghvachliani on 20.10.25.
//

import UIKit

class APPOTMVC: UIViewController {
    private var TopView: APPOTM_TopView = APPOTM_TopView()
    private var middleView: APPOTM_MiddleView = APPOTM_MiddleView()
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * (229 / 393),
                                        height: UIScreen.main.bounds.height * (358 / 952))
        
        let collection = UICollectionView(frame:.zero, collectionViewLayout: layout)
            collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor  = .systemBackground
        
        setupUI()
    }
    
    private func setupUI() {
        setupTopView()
        setupMiddleView()
        setupCollectionView()
    }
    
    private func setupTopView() {
        view.addSubview(TopView)
        TopView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            TopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            TopView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            TopView.widthAnchor.constraint(equalTo: view.widthAnchor),
            TopView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 120 / 852)
        ])
    }
    
    private func setupMiddleView() {
        view.addSubview(middleView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: TopView.bottomAnchor, constant: 25),
            middleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            middleView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(APPOTMCollectionViewCell.self, forCellWithReuseIdentifier: "APPOTMCollectionViewCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: (430 / 952))
        ])
    }
}


#Preview {
    TabBarVC()
}
