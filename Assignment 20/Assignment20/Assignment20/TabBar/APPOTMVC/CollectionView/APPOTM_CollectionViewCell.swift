
import UIKit

class APPOTMCollectionViewCell: UICollectionViewCell {
    private var infoImage: UIImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 30
        contentView.clipsToBounds = true
        
        setupInfoImage()
    }
    
    private func setupInfoImage() {
        contentView.addSubview(infoImage)
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        
        infoImage.layer.cornerRadius = UIScreen.main.bounds.width * (20 / 393)
        infoImage.clipsToBounds = true
        infoImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            infoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            infoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configureCellwith(_ image: imageInfo) {
        infoImage.image = image.image
    }
    
}
