import UIKit

class TopView: UIView {
    private var titleAndInstructionVStack: UIStackView = UIStackView()
    private var appTitleLabel: UILabel = UILabel()
    private var instructionLabel: UILabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTitleAndInstructionVStack()
        setupAppTitleLabel()
        setupInstructionLabel()
    }
    
    private func setupTitleAndInstructionVStack() {
        addSubview(titleAndInstructionVStack)
        titleAndInstructionVStack.addArrangedSubview(appTitleLabel)
        titleAndInstructionVStack.addArrangedSubview(instructionLabel)
        
        titleAndInstructionVStack.translatesAutoresizingMaskIntoConstraints = false
        
        titleAndInstructionVStack.axis = .vertical
        titleAndInstructionVStack.spacing = UIScreen.main.bounds.height * ( 15.0 / 812 )
        titleAndInstructionVStack.alignment = .leading
        titleAndInstructionVStack.distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            titleAndInstructionVStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleAndInstructionVStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleAndInstructionVStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            titleAndInstructionVStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 327.0 / 375),
            titleAndInstructionVStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 115.0 / 812),
        ])
    }
    
    private func setupAppTitleLabel() {
        addSubview(titleAndInstructionVStack)
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        appTitleLabel.text = "მიშა ცაგარელის ჰაბი"
        appTitleLabel.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * 24.0 / 812)
        appTitleLabel.textColor = .white
        appTitleLabel.textAlignment = .left
    }
    
    private func setupInstructionLabel() {
        addSubview(titleAndInstructionVStack)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        instructionLabel.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        instructionLabel.numberOfLines = 3
        instructionLabel.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * 16.0 / 812)
        instructionLabel.textColor = .gray
        instructionLabel.textAlignment = .left
    }
}
