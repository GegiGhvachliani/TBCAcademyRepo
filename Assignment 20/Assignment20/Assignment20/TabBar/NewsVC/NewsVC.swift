import UIKit

final class NewsVC: UIViewController {
    private var NewsLabel: TopView = TopView()
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor  = .systemBackground
        
        setupUI()
    }
     
    private func setupUI() {
        setupNewsLabel()
        setupTabelView()
    }
    
    private func setupNewsLabel() {
        view.addSubview(NewsLabel)
        NewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NewsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
            NewsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NewsLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 50 / 852),
            NewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * (20 / 393)),
            NewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: UIScreen.main.bounds.width * (-20 / 393)),
        ])
    }
    
    private func setupTabelView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: NewsLabel.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

}

#Preview {
    TabBarVC()
}
