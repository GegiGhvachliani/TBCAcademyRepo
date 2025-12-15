//
//  MainPageVC.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

final class MainPageVC: UIViewController {
    
    // MARK: - Properties
    private let mainPageViewModel: MainViewModel
    
    private var appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MovieMan"
        label.font = UIFont(name: "Merriweather-Black", size: ScreenSize.width * 0.05)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialization
    init(viewModel: MainViewModel) {
        self.mainPageViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
        setupMainPage()
        bindViewModel()
        mainPageViewModel.loadMovies()
    }
    
    // MARK: - Methods
    private func setupMainPage() {
        view.addSubview(appTitleLabel)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(NowShowingTableViewCell.self, forCellReuseIdentifier: "NowShowingTableViewCell")
        tableView.register(PopularTableViewCell.self, forCellReuseIdentifier: "PopularTableViewCell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "TableHeader")
        
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindViewModel() {
        mainPageViewModel.onMoviesLoaded = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - Extension

extension MainPageVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : mainPageViewModel.popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NowShowingTableViewCell", for: indexPath) as? NowShowingTableViewCell else { return UITableViewCell() }
            
            cell.configureTableViewCell(with: mainPageViewModel.nowShowingMovies)
            
            cell.tappedMovie = { [weak self] movie in
                self?.mainPageViewModel.didSelectMovie(movie)
                
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell", for: indexPath) as? PopularTableViewCell else { return UITableViewCell() }
            
            let movie = mainPageViewModel.popularMovies[indexPath.row]
            cell.configurePopularTableCell(with: movie)
            cell.posterTap = { [weak self] movie in
                self?.mainPageViewModel.didTapPoster(movie)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeader.identifier) as? TableHeader else {
            return nil }
        
        let title = section == 0 ? "Now Showing" : "Popular"
        header.configureWith(title: title)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
}


extension MainPageVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let movie = mainPageViewModel.popularMovies[indexPath.row]
            mainPageViewModel.didSelectMovie(movie)
        }
    }
}

#Preview {
    let viewModel = MainViewModel()
    let mainPage = MainPageVC(viewModel: viewModel)
    return mainPage
}
