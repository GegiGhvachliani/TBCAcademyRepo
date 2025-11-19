import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        complains.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? Cell else { return UICollectionViewCell() }
        
        cell.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.05)
        
        cell.configureCellWith(wuwuni: complains[indexPath.row])
        
        return cell
    }
    
    
}
