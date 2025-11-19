//
//  CountryListVC.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//

import UIKit
import TinyConstraints
import CommonUIComponents

public final class CountryListVC: UIViewController {
    // MARK: Properties
    private let titleLabel: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let viewModel: MainPageViewModel
    
    // MARK: Life Cycles
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    public init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        setupTitleLabel()
        setupTableView()
        setupConstraints()
        setupViewModel()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Title"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 37, weight: .bold)
        titleLabel.textAlignment = .left
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
    }

    
    private func setupConstraints() {
        // MARK: TinyConstraints
        titleLabel.top(to: view.safeAreaLayoutGuide, offset: -10)
        titleLabel.leading(to: view, offset: 18)
        titleLabel.height(45)

        tableView.edgesToSuperview(excluding: .top)
        tableView.topToBottom(of: titleLabel, offset: 10)
    }
    
    
    private func setupViewModel() {
        viewModel.releadTableView = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension CountryListVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ScreenSize.height * (60 / 812)
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countriesCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell,
              let country = viewModel.countryAt(index: indexPath.row)
        else { return UITableViewCell() }
        
        cell.configure(with: country)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.countries[indexPath.item]
        let viewModel = InfoPageViewModel(country: country)
        let infoPage = InfoPageViewController(infoPageViewModel: viewModel)
        navigationController?.pushViewController(infoPage, animated: true)
    }
}

