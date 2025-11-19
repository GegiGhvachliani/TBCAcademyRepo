import UIKit


class MainVC: UIViewController {
    //MARK: Properties
    private var background: Background = Background()
    private var topView: TopView = TopView()
    
    var zodiacName: String = ""
    private var inputStack: UIStackView = UIStackView()
    private var inputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "ზოდიაქოს სახელი"
        label.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (13.0 / 812))
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    private var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: ქალწული / virgo", attributes: [.foregroundColor: UIColor.gray, .font: UIFont.boldSystemFont(ofSize: 17)])
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        textField.textColor = .white
        textField.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * ( 14.0 / 812 ))
        
        return textField
    }()
    private var inputInformerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = ""
        label.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (10.0 / 812))
        label.textColor = .red
        label.textAlignment = .left
        
        return label
    }()
    private let validZodiacSigns = [
        "ვერძი", "aries",
        "კურო", "taurus",
        "ტყუპები", "gemini",
        "კირჩხიბი", "cancer",
        "ლომი", "leo",
        "ქალწული", "virgo",
        "სასწორი", "libra",
        "მორიელი", "scorpio",
        "მშვილდოსანი", "sagittarius",
        "თხის რქა", "capricorn",
        "მერწყული", "aquarius",
        "თევზები", "pisces"
    ]
    
    private var nextButton: UIButton = UIButton()
    
    
    //MARK: Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
    }
    
    //MARK: Methods
    private func setupUI() {
        setupBackground()
        setupTopView()
        
        setupInputStack()
        setupNextButton()
    }
    
    private func setupBackground() {
        view.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            background.heightAnchor.constraint(equalTo: view.heightAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupTopView() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupInputStack() {
        view.addSubview(inputStack)
        inputStack.translatesAutoresizingMaskIntoConstraints = false
        inputStack.addArrangedSubview(inputLabel)
        inputStack.addArrangedSubview(inputTextField)
        inputStack.addArrangedSubview(inputInformerLabel)
        
        inputStack.axis = .vertical
        inputStack.spacing = 4
        inputStack.alignment = .fill
        inputStack.distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            inputStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335.0 / 375),
            inputStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 80 / 812),
            inputStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230)
            
        ])
        
    }
    
    private func setupNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.setTitle("შემდეგი", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (17.0 / 812))
        nextButton.backgroundColor = .violet
        nextButton.layer.cornerRadius = UIScreen.main.bounds.height * (10.0 / 812)
        nextButton.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: inputStack.bottomAnchor, constant: UIScreen.main.bounds.height * (25.0 / 812)),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335.0 / 375),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 44.0 / 812)
        ])
        
        nextButton.addAction(UIAction(handler: { [weak self] action in
            guard let text = self?.inputTextField.text, text != ""  else { return }
            
            let lowercasedText = text.lowercased()
            
            self?.inputInformerLabel.text = ""
            if ((self?.validZodiacSigns.contains(lowercasedText)) != false) {
                self?.zodiacName = lowercasedText
                self?.buttonAction()
            } else {
                self?.inputInformerLabel.text = "ზოდიაქო ვერ მოიძებნა"
            }
        }), for: .touchUpInside)
    }
    
    private func buttonAction() {
        let nextVC = DescriptionVC()
        nextVC.zodiacName = zodiacName
        nextVC.MainDelegate = self
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
    
#Preview {
    MainVC()
}
extension MainVC: ColorChangerDelegate {
    func changeColor(color: UIColor) {
        self.view.backgroundColor = color
    }
}
