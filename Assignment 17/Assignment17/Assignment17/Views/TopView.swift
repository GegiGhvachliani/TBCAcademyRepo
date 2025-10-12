
import UIKit

class TopView: UIView {
    
     var activeTasksLabel: UILabel = UILabel()
     var shalvaImage: UIImageView = UIImageView()
     var shalvaImageSticker: UILabel = UILabel()

     var completeAllOrNothingButton: UIButton = UIButton()
    
    
    var activeTasksCount: Int = 3  

    init() {
        super.init(frame: .zero)
        
        setupUI()
        backgroundColor = .viewBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        setupConstraints()
        setupactiveTasksLabel()
        setupShalvaImage()
        setupShalvaImageSticker()
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 90.0/430),
        ])
    }
    
    private func setupactiveTasksLabel() {
        addSubview(activeTasksLabel)
        activeTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        
        activeTasksLabel.text = "შენ გაქვს \(activeTasksCount) აქტიური თასქი"
        activeTasksLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height * Double( 23.0 / 932.0), weight: .semibold)
        activeTasksLabel.textColor = .label
        activeTasksLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            activeTasksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIScreen.main.bounds.width * (20 / 430))
        ])
    
    }
    
    private func setupShalvaImage() {
        addSubview(shalvaImage)
        shalvaImage.translatesAutoresizingMaskIntoConstraints = false
        
        shalvaImage.image = UIImage(named: "Shalva")
        
        NSLayoutConstraint.activate([
            shalvaImage.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            shalvaImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            shalvaImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 50.0 / 430),
            shalvaImage.heightAnchor.constraint(equalTo: shalvaImage.widthAnchor)
        ])
    }
    
    private func setupShalvaImageSticker() {
        addSubview(shalvaImageSticker)
        shalvaImageSticker.translatesAutoresizingMaskIntoConstraints = false
        
        shalvaImageSticker.text = String(tasksToDo.count - activeTasksCount)
        shalvaImageSticker.textColor = .white
        shalvaImageSticker.textAlignment = .center
        shalvaImageSticker.backgroundColor = .systemOrange
        shalvaImageSticker.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        shalvaImageSticker.layer.cornerRadius = 8
        shalvaImageSticker.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            shalvaImageSticker.bottomAnchor.constraint(equalTo: shalvaImage.bottomAnchor, constant: UIScreen.main.bounds.height * (1 / 932)),
            shalvaImageSticker.rightAnchor.constraint(equalTo: shalvaImage.rightAnchor, constant: UIScreen.main.bounds.width * (-2 / 430)),
            shalvaImageSticker.widthAnchor.constraint(equalTo: shalvaImage.widthAnchor, multiplier: 1.0/3),
            shalvaImageSticker.heightAnchor.constraint(equalTo: shalvaImage.heightAnchor, multiplier:  1.0/3)
        ])
    }
    
    
    
}

#Preview {
    TopView()
}
