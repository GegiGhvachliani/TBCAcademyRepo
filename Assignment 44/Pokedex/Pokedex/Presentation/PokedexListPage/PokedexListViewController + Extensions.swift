//
//  PokedexListViewController + Extensions.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//

import UIKit
import Combine

extension PokedexListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pokedexes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokedexCell", for: indexPath) as? PokedexCell else {
            return UICollectionViewCell()
        }
        
        let pokedex = viewModel.pokedexes[indexPath.item]
        cell.configure(with: pokedex)
        
        return cell
    }
}

extension PokedexListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokedex = viewModel.pokedexes[indexPath.item]
        coordinator?.showPokedexDetails(pokedexItem: pokedex)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let last5thIndex = viewModel.pokedexes.count - 5
        if indexPath.item >= last5thIndex {
            viewModel.loadMore()
        }
    }
}
