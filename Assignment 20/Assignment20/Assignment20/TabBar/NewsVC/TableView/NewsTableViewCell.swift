
import UIKit

final class NewsTableViewCell: UITableViewCell {
    // MARK: Properties
    private var containerForCell: UIView = UIView()
    
    private var newsVstack: UIStackView = UIStackView()
    private var newsImage: UIImageView = UIImageView()
    private var newsTitleLabel: UILabel = UILabel()
    private var newsDescriptionLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // MARK: Life Cycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        setupContainerForCell()
        setupNewsVStack()
        moveNewsIntoStack()
        setupInfoViews()
        
    }
    
    private func setupContainerForCell() {
        contentView.addSubview(containerForCell)
        containerForCell.translatesAutoresizingMaskIntoConstraints = false
        
        containerForCell.backgroundColor = .systemGray6
        
        containerForCell.layer.cornerRadius = UIScreen.main.bounds.width * (20 / 393)
        containerForCell.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            containerForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIScreen.main.bounds.height * ( 5 / 852)),
            containerForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: UIScreen.main.bounds.height * ( -5 / 852)),
            containerForCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: UIScreen.main.bounds.width * ( 20 / 393)),
            containerForCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: UIScreen.main.bounds.width * ( -20 / 393))
        ])
    }
    
    private func setupNewsVStack() {
        containerForCell.addSubview(newsVstack)
        newsVstack.translatesAutoresizingMaskIntoConstraints = false
        
        newsVstack.axis = .vertical
        newsVstack.spacing = 0
        newsVstack.alignment = .fill
        newsVstack.distribution = .fillProportionally
        
        newsVstack.backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            newsVstack.topAnchor.constraint(equalTo: containerForCell.topAnchor, constant: UIScreen.main.bounds.width * (15 / 393)),
            newsVstack.bottomAnchor.constraint(equalTo: containerForCell.bottomAnchor, constant: UIScreen.main.bounds.width * (-15 / 393)),
            newsVstack.leadingAnchor.constraint(equalTo: containerForCell.leadingAnchor, constant: UIScreen.main.bounds.width * (15 / 393)),
            newsVstack.trailingAnchor.constraint(equalTo: containerForCell.trailingAnchor, constant: UIScreen.main.bounds.width * (-15 / 393))
        ])
        
    }
    
    private func moveNewsIntoStack() {
        
        newsVstack.addArrangedSubview(newsImage)
        newsVstack.addArrangedSubview(newsTitleLabel)
        newsVstack.addArrangedSubview(newsDescriptionLabel)
    }
    
    private func setupInfoViews() {
        setupNewsImage()
        setupNewsTitleLabel()
        setupNewsDescriptionLabel()
    }
    
    private func setupNewsImage() {
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        
        newsImage.layer.cornerRadius = UIScreen.main.bounds.width * (15 / 393)
        newsImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            newsImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 215 / 290),
            newsImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 325 / 393),
        ])
    }
    
    private func setupNewsTitleLabel() {
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newsTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        newsTitleLabel.textAlignment = .left
        newsTitleLabel.textColor = .label
        
    }
    
    private func setupNewsDescriptionLabel() {
        newsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newsDescriptionLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (12 / 393), weight: .medium )
        newsDescriptionLabel.textColor = .gray
        newsDescriptionLabel.textAlignment = .left
        newsDescriptionLabel.numberOfLines = 0
    }
    
    func configureCell(with news: News) {
        newsImage.image = news.image
        newsTitleLabel.text = news.newsTitle
        newsDescriptionLabel.text = news.newsDescription
    }
}


#Preview {
    NewsVC()
}

