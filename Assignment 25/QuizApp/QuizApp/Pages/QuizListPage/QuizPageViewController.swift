//
//  QuizPageViewController.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class QuizPageViewController: UIViewController {
    
    // MARK: Properties
    private var viewModel: QuizPageViewModel
    
    var getQuestions: (() -> Void)?
    
    private let quizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Quiz"
        label.font = UIFont.systemFont(ofSize: ScreenSize.height * 0.04, weight: .regular)
        label.textColor = .systemBackground
        label.textAlignment = .left
        
        return label
    }()
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .button
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(red: 183, green: 178, blue: 249, alpha: 100)
        button.layer.cornerRadius = ScreenSize.height * 0.025
        button.clipsToBounds = true
        
        button.addAction(UIAction { [weak self] _ in
            self?.handleReset()
        }, for: .touchUpInside)
        
        return button
    }()
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight = ScreenSize.height * 0.085
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    // MARK: Initializations
    init (viewModel: QuizPageViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        bindViewModel()
        setupUI()
       
        
    }
    
    // MARK: Methods
    private func setupUI() {
        navigationItem.hidesBackButton = true

        view.addSubview(quizLabel)
        view.addSubview(resetButton)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuizPageTableViewCell.self, forCellReuseIdentifier: "QuizPageTableViewCell")
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // quizLabel
            quizLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quizLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.0625),
            quizLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            // resetButton
            resetButton.topAnchor.constraint(equalTo: quizLabel.topAnchor),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ScreenSize.width * (-0.0625)),
            resetButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.215),
            resetButton.heightAnchor.constraint(equalTo: quizLabel.heightAnchor),
            
            // tableView
            tableView.topAnchor.constraint(equalTo: quizLabel.bottomAnchor, constant: 1),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func bindViewModel() {
        viewModel.onQuestionsLoaded = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func handleReset() {
        viewModel.reset()
        tableView.reloadData()
    }
    
    var onResetTapped: (() -> Void)?
    
}

    // MARK: ViewController extension
extension QuizPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfQuestions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuizPageTableViewCell", for: indexPath) as? QuizPageTableViewCell else { return UITableViewCell() }
        
        let question = viewModel.questions[indexPath.row]
        cell.configure(questionNumber: question)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let question = viewModel.questions[indexPath.row]
        let viewModel = QuestionPageViewModel(question: question)
        let nextVC = QuestionPageViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
