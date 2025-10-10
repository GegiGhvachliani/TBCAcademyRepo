import UIKit

class MainVC: UIViewController {
    
    private var topView: TopView = TopView()
    private var completeAllOrNothingButton: UIButton = UIButton()
    private var progressView: ProgressView = ProgressView()
    
    private var progressLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackground
        
        
        setupUI()
    }
    
    private func setupUI() {
        setupTopView()
        setupCompleteAllOrNothingButton()
        setupProgressLabel()
        setupProgressView()
    }
    
    private func setupTopView() {
        view.addSubview(topView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    private func setupCompleteAllOrNothingButton() {
        view.addSubview(completeAllOrNothingButton)
        completeAllOrNothingButton.translatesAutoresizingMaskIntoConstraints = false
        
        completeAllOrNothingButton.setTitle("ყველა შეასრულე", for: .normal) //TODO: "ყველა შევასრულე"-ს დაჭერის შემთხვევაში, ყველა თასქის სტატუსი უნდა შეიცვალოს შესრულებულზე.
        completeAllOrNothingButton.titleLabel?.textColor = .white
        completeAllOrNothingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        completeAllOrNothingButton.layer.cornerRadius = 16
        completeAllOrNothingButton.clipsToBounds = true
        completeAllOrNothingButton.titleLabel?.textAlignment = .center
        
        NSLayoutConstraint.activate([
            completeAllOrNothingButton.topAnchor.constraint(equalTo: topView.bottomAnchor),
            completeAllOrNothingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completeAllOrNothingButton.widthAnchor.constraint(equalToConstant: 400),
            completeAllOrNothingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            gradient.colors = [
                UIColor(red: 0.451 , green: 0.671, blue: 1.0, alpha: 1.0).cgColor,
                UIColor(red: 0.274, green: 0.753, blue: 0.761, alpha: 1.0).cgColor
            ]
            gradient.startPoint = CGPoint(x: 0, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            gradient.frame = self.completeAllOrNothingButton.bounds
            self.completeAllOrNothingButton.layer.insertSublayer(gradient, at: 0)
            
            
        }
    }
    
    private func setupProgressLabel() {
        view.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        progressLabel.text = "პროგრესი"
        progressLabel.font = UIFont.systemFont(ofSize: 23)
        progressLabel.textColor = .label
        
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: completeAllOrNothingButton.bottomAnchor, constant: 20),
            progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressLabel.heightAnchor.constraint(equalToConstant: 25),
            progressLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    private func setupProgressView() {
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 20),
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
}


#Preview {
    MainVC()
}
