import UIKit

// რადგან figma-ში დიზაინი iphone 13-ში იყო აწყობილი, ყველა ეკრანის ზომაზე ოპტიმიზაციისთვის, პროპორციების გასაწერად, ვიხელმძღვანელე მისი ზომებით(375x812)

// სხვადასხვა კლასებში გაწერილი არ მაქვს უკეთ წაკითხვადობისთვის და ბოდიშს გიხდი.
// სანამ ნახავ, მანამდე თუ მოვასწარი სწავლა, აუცილებლად გადავანაწილებ.

class ProfileVC: UIViewController {
    //MARK: Properties
    private var computerImage: UIImageView = {
        var computerImage = UIImageView()
        
        computerImage.translatesAutoresizingMaskIntoConstraints = false
        computerImage.image = UIImage(systemName: "lock.laptopcomputer")
        computerImage.tintColor = .black
        computerImage.contentMode = .scaleAspectFill
        
        return computerImage
    }()
    
    
    private var greetingAndInstructionVStack: UIStackView = UIStackView()
    private var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .label
        label.textAlignment = .left
        label.text = "მოგესალმებით!"
        label.font = UIFont(name: "sylfaen", size:  UIScreen.main.bounds.width * (24.0 / 375))
        return label
    }()
    private var instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        label.textColor = .systemGray2
        label.font = UIFont(name: "sylfaen", size:  UIScreen.main.bounds.width * (14.0 / 375))
        
       return label
    }()
    
    private var authorizationwithLineHStack: UIStackView = UIStackView()
    private var authorizationLabel: UILabel = {
        var label = UILabel()
        
        
        label.text = "ავტორიზაცია"
        label.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * ( 15.0 / 375))
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    private var LineView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorTBC
        
        return view
    }()
    
    private var authorizationVStack: UIStackView = UIStackView()
    private var nameVStack: UIStackView = UIStackView()
    private var emailVStack: UIStackView = UIStackView()
    private var mobileNUmberVStack: UIStackView = UIStackView()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "სახელი"
        label.textColor = .label
        label.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * (12.0 / 375))
        
        return label
    }()
    private var emailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "ელ. ფოსტა"
        label.textColor = .label
        label.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * (12.0 / 375))
        
        return label
    }()
    private var mobileNumberLabel: UILabel = {
        let label = UILabel()
        
        label.text = "მობ. ნომერი"
        label.textColor = .label
        label.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * (12.0 / 375))
        
        return label
    }()
    
    private var nameTextField: UITextField  = {
        let textField = UITextField()
        
        textField.placeholder = "მაგ: ვასო"
        textField.borderStyle = .roundedRect
        textField.textColor = .gray
        textField.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * (14.0 / 375))
        
        return textField
    }()

    private var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "მაგ: developer@tbc.com"
        textField.borderStyle = .roundedRect
        textField.textColor = .gray
        textField.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * (14.0 / 375))
        
        return textField
    }()
    private var mobileNumberTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "მაგ: 599999999"
        textField.borderStyle = .roundedRect
        textField.textColor = .gray
        textField.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.width * (14.0 / 375))
        
        return textField
    }()
    
    private var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .colorTBC
        button.setTitle("შესვლა", for: .normal)
        button.titleLabel!.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.height * ( 17.0 / 812))
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private var lOrRHStack: UIStackView = UIStackView()
    private var leftline: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        
        line.backgroundColor = .systemGray4
        line.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        return line
    }()
    private var orLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "ან"
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.height * (16.0 / 812))
        
        return label
    }()
    private var rightLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false

        line.backgroundColor = .systemGray4
        line.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        return line
    }()
    
    private var GFVStack: UIStackView = UIStackView()
    private var guguliButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "g.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(image, for: .normal)
        button.setTitle(" გამოიყენეთ გუგული", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel!.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.height * (16.0 / 812))
        button.titleLabel!.textAlignment = .center
        button.tintColor = .label
        button.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * (12.0 / 812)
        
        return button
    }()
    private var faceburgButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "f.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(image, for: .normal)
        button.setTitle(" გამოიყენეთ ფეისბურგი", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel!.font = UIFont(name: "sylfaen", size: UIScreen.main.bounds.height * (16.0 / 812))
        button.titleLabel!.textAlignment = .center
        button.tintColor = .label
        button.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * (12.0 / 812)
        
        return button
    }()
    
    //MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        computerImageSetup()
        greetingAndInstructionVStackSetup()
        authorizationwithLineHStackSetup()
        authorizationVStackSetup()
        enterButtonSetup()
        LorRHStackSetup()
        GFVStackSetup()
    }
    
    private func authorizationSetup() {
        nameVStackSetup()
        emailVStackSetup()
        mobileNUmberVStackSetup()
    }
    
    //MARK: methods
    private func computerImageSetup() {
        view.addSubview(computerImage)
        
        NSLayoutConstraint.activate([
            computerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            computerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            computerImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 90.0 / 375.0),
            computerImage.heightAnchor.constraint(equalTo: computerImage.widthAnchor, multiplier: 5.0 / 9),
        ])
        
    }

    private func greetingAndInstructionVStackSetup() {
        greetingAndInstructionVStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingAndInstructionVStack)
        
        greetingAndInstructionVStack.axis = .vertical
        greetingAndInstructionVStack.spacing = -10
        greetingAndInstructionVStack.alignment = .fill
        greetingAndInstructionVStack.distribution = .fill
                
        greetingAndInstructionVStack.addArrangedSubview(greetingLabel)
        greetingAndInstructionVStack.addArrangedSubview(instructionLabel)
        
        NSLayoutConstraint.activate([
            greetingAndInstructionVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingAndInstructionVStack.topAnchor.constraint(equalTo: computerImage.bottomAnchor, constant: UIScreen.main.bounds.height * (25.0 / 812)),
            greetingAndInstructionVStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335.0 / 375),
            greetingAndInstructionVStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 124.0 / 812)
        ])
    }
    
    private func authorizationwithLineHStackSetup() {
        view.addSubview(authorizationwithLineHStack)
        authorizationwithLineHStack.translatesAutoresizingMaskIntoConstraints = false
        
        authorizationwithLineHStack.axis = .vertical
        authorizationwithLineHStack.spacing = 0
        authorizationwithLineHStack.distribution = .fill
        authorizationwithLineHStack.alignment = .fill
        
        authorizationwithLineHStack.addArrangedSubview(authorizationLabel)
        authorizationwithLineHStack.addArrangedSubview(LineView)
        
                
        NSLayoutConstraint.activate([
            authorizationwithLineHStack.centerXAnchor.constraint(equalTo: greetingAndInstructionVStack.centerXAnchor),
            authorizationwithLineHStack.topAnchor.constraint(equalTo: greetingAndInstructionVStack.bottomAnchor, constant: 0),
            authorizationwithLineHStack.widthAnchor.constraint(equalTo: greetingAndInstructionVStack.widthAnchor, multiplier: 0.95),
            authorizationwithLineHStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 42.0 / 812),
            LineView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
    }
    
    private func nameVStackSetup() {
        nameVStack.translatesAutoresizingMaskIntoConstraints = false
        nameVStack.addArrangedSubview(nameLabel)
        nameVStack.addArrangedSubview(nameTextField)
        
        nameVStack.axis = .vertical
        nameVStack.spacing = 0
        nameVStack.alignment = .fill
        nameVStack.distribution = .fillProportionally
        
    }
    
    private func emailVStackSetup() {
        emailVStack.translatesAutoresizingMaskIntoConstraints = false
        emailVStack.addArrangedSubview(emailLabel)
        emailVStack.addArrangedSubview(emailTextField)
        
        emailVStack.axis = .vertical
        emailVStack.spacing = 0
        emailVStack.alignment = .fill
        emailVStack.distribution = .fillProportionally
        
    }
    
    private func mobileNUmberVStackSetup() {
        mobileNUmberVStack.translatesAutoresizingMaskIntoConstraints = false
        mobileNUmberVStack.addArrangedSubview(mobileNumberLabel)
        mobileNUmberVStack.addArrangedSubview(mobileNumberTextField)
        
        mobileNUmberVStack.axis = .vertical
        mobileNUmberVStack.spacing = 0
        mobileNUmberVStack.alignment = .fill
        mobileNUmberVStack.distribution = .fillProportionally
        
    }
    
    private func authorizationVStackSetup() {
        view.addSubview(authorizationVStack)
        authorizationVStack.translatesAutoresizingMaskIntoConstraints = false
        authorizationSetup()
        
        authorizationVStack.addArrangedSubview(nameVStack)
        authorizationVStack.addArrangedSubview(emailVStack)
        authorizationVStack.addArrangedSubview(mobileNUmberVStack)
        
        authorizationVStack.axis = .vertical
        authorizationVStack.spacing = UIScreen.main.bounds.height * ( 8.0 / 812)
        authorizationVStack.alignment = .fill
        authorizationVStack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            authorizationVStack.centerXAnchor.constraint(equalTo: authorizationwithLineHStack.centerXAnchor),
            authorizationVStack.topAnchor.constraint(equalTo: authorizationwithLineHStack.bottomAnchor, constant: UIScreen.main.bounds.height * ( 24.0 / 812)),
            authorizationVStack.widthAnchor.constraint(equalTo: greetingAndInstructionVStack.widthAnchor),
            authorizationVStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 220.0 / 812)
        ])
        
    }
    
    private func enterButtonSetup() {
        view.addSubview(enterButton)
        
        enterButton.layer.cornerRadius = UIScreen.main.bounds.height * (12.0 / 812)
        
        NSLayoutConstraint.activate([
            enterButton.centerXAnchor.constraint(equalTo: authorizationVStack.centerXAnchor),
            enterButton.topAnchor.constraint(equalTo: authorizationVStack.bottomAnchor, constant: UIScreen.main.bounds.height * (24.0 / 812)),
            enterButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 46.0 / 812),
            enterButton.widthAnchor.constraint(equalTo: authorizationVStack.widthAnchor)
        ])
        
    }
    
    private func LorRHStackSetup() {
        view.addSubview(lOrRHStack)
        lOrRHStack.translatesAutoresizingMaskIntoConstraints = false
        
        lOrRHStack.axis = .horizontal
        lOrRHStack.spacing = 10
        lOrRHStack.alignment = .center
        lOrRHStack.distribution = .fill
        
        lOrRHStack.addArrangedSubview(leftline)
        lOrRHStack.addArrangedSubview(orLabel)
        lOrRHStack.addArrangedSubview(rightLine)
        
        NSLayoutConstraint.activate([
            lOrRHStack.centerXAnchor.constraint(equalTo: enterButton.centerXAnchor),
            lOrRHStack.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: UIScreen.main.bounds.height * (24.0 / 812)),
            lOrRHStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 328.0 / 375),
            lOrRHStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 22.0 / 812),
            
            
            leftline.widthAnchor.constraint(equalTo: rightLine.widthAnchor),
            leftline.heightAnchor.constraint(equalToConstant: 1),
            rightLine.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
     
    private func GFVStackSetup() {
        view.addSubview(GFVStack)
        GFVStack.translatesAutoresizingMaskIntoConstraints = false
        
        GFVStack.axis = .vertical
        GFVStack.spacing = UIScreen.main.bounds.height * ( 24.0 / 812)
        GFVStack.alignment = .fill
        GFVStack.distribution = .fillEqually
        
        GFVStack.addArrangedSubview(guguliButton)
        GFVStack.addArrangedSubview(faceburgButton)
        
        NSLayoutConstraint.activate([
            GFVStack.topAnchor.constraint(equalTo: lOrRHStack.bottomAnchor, constant: UIScreen.main.bounds.height * (24.0 / 812)),
            GFVStack.centerXAnchor.constraint(equalTo: enterButton.centerXAnchor),
            GFVStack.widthAnchor.constraint(equalTo: enterButton.widthAnchor),
            GFVStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier:  112.0 / 812),
            guguliButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48.0 / 812),
            faceburgButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48.0 / 812)
        ])
    }
    
}

#Preview {
    ProfileVC()
}

