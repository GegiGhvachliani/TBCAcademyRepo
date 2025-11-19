import UIKit

extension APPOTMVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageInfo.all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "APPOTMCollectionViewCell", for: indexPath) as? APPOTMCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCellwith(imageInfo.all[indexPath.row])
        
        return cell
    }
}
