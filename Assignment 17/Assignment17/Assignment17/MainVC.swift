import UIKit

class MainVC: UIViewController {
    //Top View
    private var topViewStack: UIStackView = UIStackView()
    private var activeTasksLabel: UILabel = UILabel()
    private var shalvaImage: UIImageView = UIImageView()
    private var remainingTasksInformerStickLabel: UILabel = UILabel()
    private var allorNothingCompletedButton: UIButton = UIButton()
    
    private var countOfReaminingTasks: Int = 3
    private var countDescriber: String =  "ეს გასაკეთებელი გაქვს"
    
    //progressView
    private var progressLabel: UILabel = UILabel()
    
    private var progressStack: UIStackView = UIStackView()
    private var oneYearTasksLabel: UILabel = UILabel()
    private var howManyTasksCompletedLabel: UILabel = UILabel()
    
    private var changeableQuantityDescriberHStack: UIStackView = UIStackView()
    private var changeableQuantityDescriber: UILabel = UILabel()
    private var changeableQuantityPercent: UILabel = UILabel()
    private var progressView: UIProgressView = UIProgressView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .myBackground
        
        setupUI()
    }
    
    private func setupUI() {
        setupActiveTasksLabel()
        setupShalvaImage()
        setupRemainingTasksInformerStickLabel()
        
        setupAllorNothingCompletedButton()
        setupProgressLabel()
        
        setupProgressStack()
        setupProgressStackThings()
        
        
    }
    
    private func setupActiveTasksLabel() {
        view.addSubview(activeTasksLabel)
        activeTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        
        activeTasksLabel.text = "შენ გაქვს \(countOfReaminingTasks) აქტიური თასქი"
        activeTasksLabel.textColor = .label
        activeTasksLabel.textAlignment = .left
        activeTasksLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * ( 22.0 / 430), weight: .semibold)
        
        
        NSLayoutConstraint.activate([
            activeTasksLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIScreen.main.bounds.width * (20.0 / 430)),
            activeTasksLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.width * (10.0 / 430)),
            activeTasksLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 350.0 / 430),
            activeTasksLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 50.0 / 930)
        ])
    }
    
    private func setupShalvaImage() {
        view.addSubview(shalvaImage)
        shalvaImage.translatesAutoresizingMaskIntoConstraints = false
        
        shalvaImage.image = UIImage(named: "Shalva")
        shalvaImage.layer.cornerRadius = UIScreen.main.bounds.width * (25 / 430)
        shalvaImage.clipsToBounds = true
        shalvaImage.layer.borderWidth = 1
        shalvaImage.layer.borderColor = UIColor.red.cgColor    //გადასაკეთებელია გრადიენტი იისფერი-შავი
        
        
        NSLayoutConstraint.activate([
            shalvaImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIScreen.main.bounds.width * (360.0 / 430)),
            shalvaImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.width * (27 / 430)),
            shalvaImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 50.0 / 430),
            shalvaImage.heightAnchor.constraint(equalTo: shalvaImage.widthAnchor)
        ])
    }
    
    private func setupRemainingTasksInformerStickLabel() {
        view.addSubview(remainingTasksInformerStickLabel)
        remainingTasksInformerStickLabel.translatesAutoresizingMaskIntoConstraints = false
        
        remainingTasksInformerStickLabel.backgroundColor = .systemOrange
        remainingTasksInformerStickLabel.layer.cornerRadius = UIScreen.main.bounds.width * (10 / 430 )
        remainingTasksInformerStickLabel.text = String(countOfReaminingTasks)
        remainingTasksInformerStickLabel.textAlignment = .center
        remainingTasksInformerStickLabel.layer.cornerRadius = shalvaImage.layer.cornerRadius / 3
        remainingTasksInformerStickLabel.clipsToBounds = true
        remainingTasksInformerStickLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (12 / 430))
        remainingTasksInformerStickLabel.textColor = .white
        
        
        NSLayoutConstraint.activate([
            remainingTasksInformerStickLabel.topAnchor.constraint(equalTo: shalvaImage.topAnchor, constant: UIScreen.main.bounds.width * (39.0 / 430)),
            remainingTasksInformerStickLabel.leftAnchor.constraint(equalTo: shalvaImage.leftAnchor, constant: UIScreen.main.bounds.width * (30.0 / 430)),
            remainingTasksInformerStickLabel.widthAnchor.constraint(equalTo: shalvaImage.widthAnchor, multiplier: 1 / 3 ),
            remainingTasksInformerStickLabel.heightAnchor.constraint(equalTo: shalvaImage.heightAnchor, multiplier: 1 / 3 )
        ])
    }
    
    private func setupAllorNothingCompletedButton() {
        view.addSubview(allorNothingCompletedButton)
        allorNothingCompletedButton.translatesAutoresizingMaskIntoConstraints = false
        
        allorNothingCompletedButton.setTitle("ყველა შევასრულე", for: .normal) //TODO: ყველა შევასრულე"-ს დაჭერის შემთხვევაში, ყველა თასქის სტატუსი უნდა შეიცვალოს შესრულებულზე.
        // ბონუსი: "ყველა შევასრულე"-ს დაჭერის შემდეგ ტექსტი შეიცვალოს "ვერცერთი შევასრულე"-თი და მასზე დაჭერით გან-ინიშნოს თასქები (მერე ისევ დაეწეროს "ყველა შევასრულე"
        
        allorNothingCompletedButton.backgroundColor = .systemCyan  // გრადიენტი ცისფერიდან ზურმუხტისფერში
        allorNothingCompletedButton.titleLabel?.textColor = .white
        allorNothingCompletedButton.configuration?.titleAlignment = .center
        allorNothingCompletedButton.layer.cornerRadius = UIScreen.main.bounds.width * ( 12.5 / 430)
        allorNothingCompletedButton.clipsToBounds = true
        allorNothingCompletedButton.titleLabel?.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (18 / 430), weight: .semibold)
        
        NSLayoutConstraint.activate([
            allorNothingCompletedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allorNothingCompletedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.width * (110 / 430)),
            allorNothingCompletedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 397 / 430),
            allorNothingCompletedButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 52 / 930)
        ])
        
    }
    
    
    private func setupProgressLabel() {
        view.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        progressLabel.text = "პროგრესი"
        progressLabel.textColor = .label
        progressLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (22 / 430))
        progressLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: allorNothingCompletedButton.bottomAnchor, constant: UIScreen.main.bounds.width * (15 / 430)),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 390 / 430),
            progressLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 35 / 930)
        ])
        
    }
    
    private func setupProgressStack() {
        view.addSubview(progressStack)
        progressStack.translatesAutoresizingMaskIntoConstraints = false
        
        progressStack.axis = .vertical
        progressStack.spacing = 0
        progressStack.alignment = .fill
        progressStack.distribution = .fillProportionally
        progressStack.backgroundColor = .myTable
        progressStack.layer.cornerRadius = UIScreen.main.bounds.width * ( 15 / 430)
        progressLabel.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            progressStack.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: UIScreen.main.bounds.width * (15 / 430)),
            progressStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 140 / 930),
            progressStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 390 / 430)
        ])
    }
    
    private func setupProgressStackThings() {
        setupOneYearTasksLabel()
        setupHowManyTasksCompletedLabel()
        setupChangeableQuantityDescribers()
        setupProgressView()
        
    }
    private func setupChangeableQuantityDescribers() {
        setupChangeableQuantityDescriberHStack()
        setupChangeableQuantityDescriber()
        setupChangeableQuantityPercent()
        
    }
    
    private func setupOneYearTasksLabel() {
        progressStack.addArrangedSubview(oneYearTasksLabel)
        oneYearTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        
        oneYearTasksLabel.text = "1 წლის თასქები"
        oneYearTasksLabel.textColor = .label
        oneYearTasksLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (20 / 430), weight: .medium)
        oneYearTasksLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            oneYearTasksLabel.leadingAnchor.constraint(equalTo: progressStack.leadingAnchor, constant: UIScreen.main.bounds.width * (15 / 430)),
            oneYearTasksLabel.trailingAnchor.constraint(equalTo: progressStack.trailingAnchor, constant: UIScreen.main.bounds.width * (15 / 430))
        ])
        
    }
    
    private func setupHowManyTasksCompletedLabel() {
        progressStack.addArrangedSubview(howManyTasksCompletedLabel)
        howManyTasksCompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        howManyTasksCompletedLabel.text = "\(countOfReaminingTasks)/6 თასქი შესრულებული"
        howManyTasksCompletedLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (20 / 430), weight: .medium)
        howManyTasksCompletedLabel.textColor = .gray
        howManyTasksCompletedLabel.textAlignment = .left
        
        
        NSLayoutConstraint.activate([
            howManyTasksCompletedLabel.leadingAnchor.constraint(equalTo: progressStack.leadingAnchor, constant: UIScreen.main.bounds.width * (15 / 430)),
            howManyTasksCompletedLabel.trailingAnchor.constraint(equalTo: progressStack.trailingAnchor, constant: UIScreen.main.bounds.width * (15 / 430))
        ])
        
    }
    
    private func setupChangeableQuantityDescriberHStack() {
        progressStack.addArrangedSubview(changeableQuantityDescriberHStack)
        changeableQuantityDescriberHStack.translatesAutoresizingMaskIntoConstraints = false
        
        changeableQuantityDescriberHStack.axis = .horizontal
        changeableQuantityDescriberHStack.distribution = .fillProportionally
        changeableQuantityDescriberHStack.alignment = .fill
        changeableQuantityDescriberHStack.spacing = 0
        
        
    }
    
    
    private func setupChangeableQuantityDescriber() {
        changeableQuantityDescriberHStack.addArrangedSubview(changeableQuantityDescriber)
        changeableQuantityDescriber.translatesAutoresizingMaskIntoConstraints = false
        
        changeableQuantityDescriber.text = countDescriber
        changeableQuantityDescriber.textColor = .gray
        howManyTasksCompletedLabel.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width *  (14 / 430), weight: .thin)
    }
    
    private func setupChangeableQuantityPercent() {
        changeableQuantityDescriberHStack.addArrangedSubview(changeableQuantityPercent)
        changeableQuantityPercent.translatesAutoresizingMaskIntoConstraints = false
        
        changeableQuantityPercent.text = "\((countOfReaminingTasks / 6) * 100) %      "
        changeableQuantityPercent.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * (20 / 430))
        changeableQuantityPercent.textColor = .label
        changeableQuantityPercent.textAlignment = .right
        
        NSLayoutConstraint.activate([
            changeableQuantityPercent.trailingAnchor.constraint(equalTo: changeableQuantityDescriberHStack.trailingAnchor, constant: UIScreen.main.bounds.width *  (15 / 430))
        ])
    }
    
    private func setupProgressView() {
        progressStack.addArrangedSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        progressView.progress = Float(6 - countOfReaminingTasks) / 6
        progressView.progressTintColor = .systemBlue
        progressView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 20 / 913).isActive = true
        progressView.layer.cornerRadius = UIScreen.main.bounds.height * (10 / 930)
        progressView.clipsToBounds = true
    }
    
    
}


#Preview {
    MainVC()
}
