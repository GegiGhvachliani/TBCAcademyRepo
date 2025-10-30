//
//  QuestionPageViewController.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class QuestionPageViewController: UIViewController {
    // MARK: Properties
    private var viewModel: QuestionPageViewModel
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .systemBackground
        button.contentHorizontalAlignment = .center
        
        button.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    private let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: ScreenSize.height * 0.02, weight: .medium)
        label.textColor = .white
        label.backgroundColor = .button
        label.layer.borderWidth = 0.7
        label.layer.borderColor = .init(red: 183, green: 278, blue: 249, alpha: 100)
        label.textAlignment = .center
        label.layer.cornerRadius = ScreenSize.width * 0.055
        label.clipsToBounds = true
        
        return label
    }()
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: ScreenSize.width * 0.0625, weight: .regular)
        label.textColor = .systemBackground
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight = ScreenSize.width * 0.15625
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        
        return tableView
    }()
    private let correctIncorectCounterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: ScreenSize.width * (16 / 320), weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .button
        label.layer.cornerRadius = ScreenSize.width * 0.035
        label.clipsToBounds = true
        
        label.text = "     correct 1 / incorrect 4"
        
        return label
    }()
    
    private var answers: [String] = []
    
    // MARK: initializations
    init(viewModel: QuestionPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: lifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupUI()
        bindViewModel()
        configureUI()
    }
    
    // MARK: Methods
    
    private func setupUI() {
        navigationItem.hidesBackButton = true
        
        view.addSubview(backButton)
        view.addSubview(questionNumberLabel)
        view.addSubview(questionLabel)
        view.addSubview(tableView)
        view.addSubview(correctIncorectCounterLabel)
        
        setupConstraints()
        
        // register tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(QuestionPageTableViewCell.self, forCellReuseIdentifier: "QuestionPageTableViewCell")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // backButton
            backButton.centerYAnchor.constraint(equalTo: questionNumberLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.03125),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            // questionNumberLabel
            questionNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            questionNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ScreenSize.width * (-0.03125)),
            questionNumberLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.11),
            questionNumberLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.265),
            
            // questionLabel
            questionLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: ScreenSize.width * 0.046),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.05),
            questionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            
            // tableView
            tableView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: ScreenSize.width * 0.046),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.04),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ScreenSize.width * (-0.04)),
            tableView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            
            // correctIncorrectCounterLabel
            correctIncorectCounterLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: ScreenSize.height * (-0.05)),
            correctIncorectCounterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.03125),
            correctIncorectCounterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ScreenSize.width * (-0.03125)),
            correctIncorectCounterLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
        ])
    }
    
    private func bindViewModel() {
        viewModel.onAnswerSelected = { [weak self] in
            self?.tableView.reloadData()
            self?.updateStatsLabel()
        }
    }
    
    private func configureUI() {
        questionNumberLabel.text = viewModel.questionNumberText
        questionLabel.text = viewModel.questionText
        updateStatsLabel()
    }
    
    func updateStatsLabel() {
        correctIncorectCounterLabel.text = viewModel.statsText
    }
}

    // MARK: extension
extension QuestionPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfAnswers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionPageTableViewCell", for: indexPath) as? QuestionPageTableViewCell else { return UITableViewCell() }
        
        
        let answer = viewModel.answer(at: indexPath.row)
        let selectedAnwer = viewModel.isAnswerSelected(at: indexPath.row)
        let correctAnswer = viewModel.isAnswerCorrect(at: indexPath.row)
        
        cell.configure(answer: answer, isSelected: selectedAnwer, isCorrect: correctAnswer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectAnswer(at: indexPath.row)
        viewModel.saveStats()
    }
}
