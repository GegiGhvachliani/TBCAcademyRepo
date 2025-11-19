import UIKit

class Background: UIView {
    
    private var backgroundImage: UIImageView = UIImageView()
    private var backgroundIcons: UIImageView = UIImageView()
    
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupBackgroundImage()
        setupBackgroundIcons()
    }
    
    private func setupBackgroundImage() {
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImage.image = UIImage(named: "skyImage")
        
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: heightAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: widthAnchor)
        ])
       }
    
    private func setupBackgroundIcons() {
        addSubview(backgroundIcons)
        backgroundIcons.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundIcons.image = UIImage(named: "iconGroup")
        
        NSLayoutConstraint.activate([
            backgroundIcons.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundIcons.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundIcons.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 714.0 / 812),
            backgroundIcons.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 316.0 / 375)
        ])
    }
    
   
}
