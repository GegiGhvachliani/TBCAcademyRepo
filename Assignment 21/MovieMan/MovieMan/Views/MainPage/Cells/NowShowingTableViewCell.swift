//
//
//  Untitled.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

class NowShowingTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var movies: [Movie] = []
    
    var tappedMovie: ((Movie) -> Void)?
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 170, height: 300)
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupCollectionView() {
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NowShowingCollectionCell.self, forCellWithReuseIdentifier: "NowShowingCollectionCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    // MARK: - Configure
    func configureTableViewCell(with movies: [Movie]) {
        self.movies = movies
        collectionView.reloadData()
    }
}

    // MARK: - Extensions
extension NowShowingTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowShowingCollectionCell", for: indexPath) as? NowShowingCollectionCell else { return UICollectionViewCell() }
        cell.configureNowShowingMovieCell(with: movies[indexPath.item])
        
        return cell
    }
    
}

extension NowShowingTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        tappedMovie?(movie)
    }
}
