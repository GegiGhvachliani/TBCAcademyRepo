
import UIKit

class Cell: UICollectionViewCell {
    private var icon: UIImageView = UIImageView()
    private var complainLabel: UILabel = UILabel()
    private var descriptionLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        setupIcon()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    private func setupIcon() {
        contentView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        icon.image = UIImage(named: "Icon")
        icon.tintColor = .white
        icon.contentMode = .center
        icon.layer.cornerRadius = UIScreen.main.bounds.height * (40 / 812) / 5
        icon.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height * (20 / 812)),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIScreen.main.bounds.height * (20 / 812)),
            icon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 40 / frame.height),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(complainLabel)
        complainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        complainLabel.textColor = .white
        complainLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        complainLabel.numberOfLines = 0
        complainLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            complainLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor),
            complainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: UIScreen.main.bounds.height * (-20 / 812)),
            complainLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10),
            complainLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 50 / frame.height),
            complainLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        descriptionLabel.textColor = .descriptionText
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: complainLabel.leadingAnchor, constant: 0),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: UIScreen.main.bounds.height * (-20 / 812)),
            descriptionLabel.topAnchor.constraint(equalTo: complainLabel.bottomAnchor, constant: -10),
            descriptionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 70 / frame.height),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureCellWith(wuwuni: Wuwuni) {
        icon.backgroundColor = wuwuni.iconColor
        complainLabel.text = wuwuni.complain
        descriptionLabel.text = wuwuni.complainDesctiption
    }
}

#Preview {
    ViewController()
}
