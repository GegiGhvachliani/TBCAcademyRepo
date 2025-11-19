import UIKit

final class ViewController: UIViewController {
    //MARK: Properties
    private var Background: BackgroundImage = BackgroundImage()
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * (156 / 375),
                                height: UIScreen.main.bounds.height * (192 / 812
                                )
        )
        
        let collection = UICollectionView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: UIScreen.main.bounds.width * (328 / 375),
                                                        height: UIScreen.main.bounds.height * (448 / 812)
                                                       ),
                                            collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    private var addComplainButton: UIButton = UIButton()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: Methods
    
    private func setupUI() {
        setupBackground()
        setupCollectionView()
        setupAddComplainButton()
    }
    
    private func setupBackground() {
        view.addSubview(Background)
        Background.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            Background.topAnchor.constraint(equalTo: view.topAnchor),
            Background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30),
            Background.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -30),
            Background.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 30)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .clear 
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 328 / 375),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 448 / 812)
        ])
    }
    
    private func setupAddComplainButton() {
        view.addSubview(addComplainButton)
        addComplainButton.translatesAutoresizingMaskIntoConstraints = false
        
        addComplainButton.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        addComplainButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        addComplainButton.backgroundColor = .systemBlue
        addComplainButton.layer.cornerRadius = UIScreen.main.bounds.width * (24 / 375)
        addComplainButton.clipsToBounds = true
       
        NSLayoutConstraint.activate([
            addComplainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addComplainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            addComplainButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48 / 812),
            addComplainButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 290 / 375)
        ])
        
        
        addComplainButton.addAction(UIAction { [weak self] _ in
            let nextVC = NextPageVC()
            nextVC.delegate = self
            nextVC.clearTextFields()
            
            self?.navigationController?.pushViewController(nextVC, animated: true)
        }, for: .touchUpInside)
    }

}

extension ViewController: CellAdderDelegate {
    func addComplain(_ wuwuni: Wuwuni) {
        complains.insert(wuwuni, at: 0)
        collectionView.reloadData()
    }
}

#Preview {
    ViewController()
}
