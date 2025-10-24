//
//  CollectionViewHeader.swift
//  IMDB Info
//

import UIKit

final class CollectionViewHeader: UICollectionReusableView {
    
    @IBOutlet private weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func makeNew(with header: String) {
        headerLabel.text = header
    }
}
