//
//  ListPageViewController.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//

import UIKit

class ListPageViewController: UIViewController {
    
    private var titleLabel = UILabel.createTitleLabelWith(title: "Magari News")
    
    private var tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight = ScreenSize.height * 0.17  // 108/812 - (Figma-ში მოცემული უჯრედის სიმაღლე) / (Figma-ში მოცემული ეკრანის სიმაღლე)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        
        return tableView
    }()
     var viewModel: ListPageViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: ListPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        configuretableView()
        setupConstraints()
        setupViewModel()
        
    }
    
    private func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        // titleLabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.08),
        
        // tableView
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configuretableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListPageCell.self, forCellReuseIdentifier: "ListPageCell")
    }
    
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

