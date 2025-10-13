import UIKit

class MainVC: UIViewController {
    // MARK: Properties
    private var topView: TopView = TopView()
    private var completeAllOrNothingButton: UIButton = UIButton()
    private var progressView: ProgressView = ProgressView()
    
    private var progressLabel: UILabel = UILabel()
    
    private var tableViewLabel: UILabel = UILabel()
    private var tableView: UITableView = {
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    //MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackground
        
        setupUI()
    }
    
    //MARK: Methods
    private func setupUI() {
        setupTopView()
        setupCompleteAllOrNothingButton()
        setupProgressLabel()
        setupButtonAction()
        setupProgressView()
        
        //tableView
        setupTableView()
        setupTableViewLabel()
        
        //top and progress views
        updateProgress()
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
        
        completeAllOrNothingButton.setTitle("ყველა შეასრულე", for: .normal)
        completeAllOrNothingButton.titleLabel?.textColor = .white
        completeAllOrNothingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        completeAllOrNothingButton.layer.cornerRadius = 16
        completeAllOrNothingButton.clipsToBounds = true
        completeAllOrNothingButton.titleLabel?.textAlignment = .center
        
        NSLayoutConstraint.activate([
            completeAllOrNothingButton.topAnchor.constraint(equalTo: topView.bottomAnchor),
            completeAllOrNothingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completeAllOrNothingButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:(400 / 430)),
            completeAllOrNothingButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 50 / 932)
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
            progressView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 390/430),
            progressView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 140 / 932)
        ])
    }
    
    private func setupTableViewLabel() {
        view.addSubview(tableViewLabel)
        tableViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tableViewLabel.text = "თასქები:"
        tableViewLabel.font = UIFont.systemFont(ofSize: 25)
        tableViewLabel.textAlignment = .left
        tableViewLabel.textColor = .label
        
        NSLayoutConstraint.activate([
            tableViewLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 22),
            tableViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 390 / 430),
            tableViewLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 30 / 932)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .viewBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 15
        
        tableView.register(TasksCell.self, forCellReuseIdentifier: "TasksCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: UIScreen.main.bounds.height * ( 70 / 932)),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    private func setupButtonAction() {
        completeAllOrNothingButton.addAction(UIAction { [weak self] _  in
            let allCompleted = tasksToDo.allSatisfy { $0.isCompleted }
            
            for i in 0..<tasksToDo.count {
                tasksToDo[i].isCompleted = !allCompleted
                
                self?.tableView.reloadData()
                self?.updateProgress()
            }
        }, for: .touchUpInside)
    }

    func updateProgress() {
        topView.updateTopViewInfos()
        progressView.updateProgressView()
        
        let allCompleted = tasksToDo.allSatisfy { $0.isCompleted }
        let buttonTitle = allCompleted ? "ვერცერთი შევასრულე" : "ყველა შევასრულე"
        completeAllOrNothingButton.setTitle(buttonTitle, for: .normal)
    }
}


#Preview {
    MainVC()
}
