
import UIKit

protocol CellAdderDelegate: AnyObject {
    func addComplain(_ wuwuni: Wuwuni)
}

class NextPageVC: UIViewController {
    
    weak var delegate: CellAdderDelegate?
    
    private var Background: BackgroundImage = BackgroundImage()
    
    private var infoVstack: UIStackView = UIStackView()
    
    private var titleLabel: UILabel = UILabel()
    private var titleTextField: UITextField = UITextField()
    private var descriptionLabel: UILabel = UILabel()
    private var descriptionTextField: UITextField = UITextField()
    
    private var chooseIconLabel: UILabel = UILabel()
    
    private var iconsHStack: UIStackView = UIStackView()
    private var redButton: UIButton = UIButton()
    private var purpleButton: UIButton = UIButton()
    private var greenButton: UIButton = UIButton()
    private var yellowButton: UIButton = UIButton()
    
    private var addButton: UIButton = UIButton()
    
    var selectedColor: UIColor? = .redBackground
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        redButton.layer.borderWidth = 3
    }
    
    private func setupUI() {
        setupBackground()
        setupInfoVStack()
        setupInfoLabelAndText()
        
        setupChooseIconLabel()
        
        setupIconsStack()
        moveButtonsIntoStack()
        
        setupAddButton()
        
    }
    
    private func setupBackground() {
        view.addSubview(Background)
        Background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Background.topAnchor.constraint(equalTo: view.topAnchor),
            Background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30),
            Background.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -30),
            Background.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 30)
        ])
    }
    
    private func setupInfoVStack() {
        view.addSubview(infoVstack)
        infoVstack.translatesAutoresizingMaskIntoConstraints = false
        
        infoVstack.axis = .vertical
        infoVstack.spacing = 5
        infoVstack.alignment = .leading
        infoVstack.distribution = .fillProportionally
        infoVstack.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            infoVstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height * (60 / 812)),
            infoVstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * (20 / 375)),
            infoVstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: UIScreen.main.bounds.width * (-20 / 375)),
        ])
    }
    
    private func setupInfoLabelAndText() {
        setupTitleLabel()
        setupTitleTextField()
        setupDescriptionLabel()
        setupDescriptionTextField()
    }
    
    private func setupTitleLabel() {
        infoVstack.addArrangedSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "სათაური"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * (25 / 812))
        ])
    }
    
    private func setupTitleTextField() {
        infoVstack.addArrangedSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        titleTextField.layer.cornerRadius = UIScreen.main.bounds.width * (10 / 375)
        titleTextField.clipsToBounds = true
        titleTextField.layer.borderWidth = 2
        titleTextField.layer.borderColor = CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "   მაგ: პანიკა, დახმარება მჭირდება",
            attributes: [
                .foregroundColor: UIColor.systemGray3,
                .font: UIFont.systemFont(ofSize: 13, weight: .medium)
            ]
        )
        titleTextField.textColor = .white
        titleTextField.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        titleTextField.leftView = leftPadding
        titleTextField.leftViewMode = .always
        
        let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        titleTextField.rightView = rightPadding
        titleTextField.rightViewMode = .always
        
        NSLayoutConstraint.activate([
            titleTextField.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * (45 / 812)),
            titleTextField.widthAnchor.constraint(equalTo: infoVstack.widthAnchor, multiplier: 1)
        ])
    }
    
    private func setupDescriptionLabel() {
        infoVstack.addArrangedSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "აღწერა"
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * (25 / 812))
        ])
    }
    
    private func setupDescriptionTextField() {
        infoVstack.addArrangedSubview(descriptionTextField)
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTextField.layer.cornerRadius = UIScreen.main.bounds.width * (10 / 375)
        descriptionTextField.clipsToBounds = true
        descriptionTextField.layer.borderWidth = 2
        descriptionTextField.layer.borderColor = CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.attributedPlaceholder = NSAttributedString(
            string: " მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ",
            attributes: [
                .foregroundColor: UIColor.systemGray3,
                .font: UIFont.systemFont(ofSize: 12, weight: .medium)
            ]
        )
        descriptionTextField.textColor = .white
        descriptionTextField.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        descriptionTextField.leftView = leftPadding
        descriptionTextField.leftViewMode = .always
        
        let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        descriptionTextField.rightView = rightPadding
        descriptionTextField.rightViewMode = .always
        
        NSLayoutConstraint.activate([
            descriptionTextField.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * (45 / 812)),
            descriptionTextField.widthAnchor.constraint(equalTo: infoVstack.widthAnchor, multiplier: 1)
        ])
    }
    
    private func setupChooseIconLabel() {
        view.addSubview(chooseIconLabel)
        chooseIconLabel.translatesAutoresizingMaskIntoConstraints = false
        
        chooseIconLabel.text = "აირჩიეთ აიქონი"
        chooseIconLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        chooseIconLabel.textColor = .white
        chooseIconLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            chooseIconLabel.topAnchor.constraint(equalTo: infoVstack.bottomAnchor, constant: UIScreen.main.bounds.height * (30 / 812)),
            chooseIconLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
    
    private func setupIconsStack() {
        view.addSubview(iconsHStack)
        iconsHStack.translatesAutoresizingMaskIntoConstraints = false
        
        iconsHStack.axis = .horizontal
        iconsHStack.spacing = UIScreen.main.bounds.width * (35 / 375)
        iconsHStack.alignment = .fill
        iconsHStack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            iconsHStack.topAnchor.constraint(equalTo: chooseIconLabel.bottomAnchor, constant: UIScreen.main.bounds.height * (30 / 812)),
            iconsHStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * (40 / 375)),
            iconsHStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: UIScreen.main.bounds.width * (-40 / 375)),
            iconsHStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 40 / 812)
        ])
    }
    
    private func moveButtonsIntoStack() {
        setup(redButton, with: .redBackground, tag: 0)
        setup(purpleButton, with: .purpleBackground, tag: 1)
        setup(greenButton, with: .greenBackground, tag: 2)
        setup(yellowButton, with: .yellowBackground, tag: 3)
    }
    
    private func setupAddButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("დამატება", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        addButton.titleLabel?.textColor = .white
        addButton.backgroundColor = .greenBackground
        addButton.titleLabel?.textAlignment = .center
        addButton.layer.cornerRadius = UIScreen.main.bounds.height * (25 / 812)
        addButton.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 140 / 375),
            addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 50 / 812)
        ])
        
        addButton.addAction(UIAction { [weak self ] _ in
            self?.delegate?.addComplain(
                Wuwuni(
                    complain: self?.titleTextField.text ?? "",
                    complainDesctiption: self?.descriptionTextField.text ?? "",
                    iconColor: self?.selectedColor ?? .redBackground
                )
            )
            
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)
    }
    
    private func setup(_ button: UIButton, with color: UIColor, tag: Int) {
        iconsHStack.addArrangedSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let bg = UIImageView()
        bg.image = UIImage(named: "Icon")
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.contentMode = .scaleAspectFit
        bg.backgroundColor = color
        button.insertSubview(bg, at: 0)
        
        button.layer.borderColor = CGColor(red: 0.165, green: 1, blue: 0, alpha: 1)
        button.backgroundColor = color
        button.layer.cornerRadius = UIScreen.main.bounds.height * (15 / 812)
        button.clipsToBounds = true
        button.tag = tag
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 40 / 812),
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            bg.topAnchor.constraint(equalTo: button.topAnchor, constant: 12),
            bg.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 12),
            bg.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12),
            bg.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -12)
        ])
        
        button.addAction(
            UIAction { [weak self] _ in
                self?.handleButtonSelection(button, color: color)
            },
            for: .touchUpInside)
    }
    
    private func handleButtonSelection(_ selectedButton: UIButton, color: UIColor) {
        [redButton, purpleButton, greenButton, yellowButton].forEach { button in
            button.layer.borderWidth = 0
        }
        selectedButton.layer.borderWidth = 4
        self.selectedColor = color
    }
    
    func clearTextFields() {
        titleTextField.text = ""
        descriptionTextField.text = ""
    }
}

#Preview {
    NextPageVC()
}
