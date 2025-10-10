
import UIKit

protocol ColorChangerDelegate: AnyObject {
    func changeColor(color: UIColor)
}
class OppositeSignVC: UIViewController{
    //MARK: Properties
    
    weak var delegate: ColorChangerDelegate?
    
    var signTitle: String = ""
    private let background: Background = Background()
    private var signImage: UIImageView = UIImageView()
    private var signLabel: UILabel = UILabel()
    
    private var redButton: UIButton = UIButton()
    private var blueButton: UIButton = UIButton()
    
    private var oppositeSigns: [String:String] = [
        "aries" : "libra",
        "taurus" : "scorpio",
        "gemini" : "sagittarius",
        "cancer" : "capricorn",
        "leo" : "aquarius",
        "virgo" : "pisces",
        "libra" : "aries",
        "scorpio" : "taurus",
        "sagittarius" : "gemini",
        "capricorn" : "cancer",
        "aquarius" : "leo",
        "pisces" : "virgo"
    ]
    
    private let engToGeo: [String : String] = [
        "aries" : "ვერძი",
        "taurus" : "კურო",
        "gemini" : "ტყუპები",
        "cancer" : "კირჩხიბი",
        "leo" : "ლომი",
        "virgo" : "ქალწული",
        "libra" : "სასწორი",
        "scorpio" : "მორიელი",
        "sagittarius" : "მშვილდოსანი",
        "capricorn" : "თხის რქა",
        "aquarius" : "მერწყული",
        "pisces" :"თევზები"
    ]
    
    //MARK: Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
    }
    
    //MARK: Methods
    private func setupUI() {
        setupBackground()
        setupSignImage()
        setupSignLabel()
        
        setupRedButton()
        setupBlueButton()
    }
    
    private func setupBackground() {
        view.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            background.heightAnchor.constraint(equalTo: view.heightAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupSignImage() {
        view.addSubview(signImage)
        signImage.translatesAutoresizingMaskIntoConstraints = false
        
        signImage.image = UIImage(named: oppositeSigns[signTitle]!)
        signImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            signImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: UIScreen.main.bounds.height * (-100.0 / 812)),
            signImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 200.0 / 375),
            signImage.heightAnchor.constraint(equalTo: signImage.widthAnchor)
        ])
    }
    
    private func setupSignLabel() {
        view.addSubview(signLabel)
        signLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signLabel.text = engToGeo[oppositeSigns[signTitle]!] ?? signTitle
        signLabel.textColor = .white
        signLabel.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (24.0 / 812))
        signLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            signLabel.topAnchor.constraint(equalTo: signImage.bottomAnchor, constant:  UIScreen.main.bounds.height * (1 / 812)),
            signLabel.centerXAnchor.constraint(equalTo: signImage.centerXAnchor),
            signLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 200.0 / 375),
            signLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 50.0 / 812)
        ])
    }
    
    private func setupRedButton() {
        view.addSubview(redButton)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        
        redButton.setTitle("წითელი", for: .normal)
        redButton.titleLabel?.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (16.0 / 812))
        redButton.backgroundColor = .red
        redButton.layer.cornerRadius = UIScreen.main.bounds.height * (15.0 / 812)
        redButton.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redButton.topAnchor.constraint(equalTo: signLabel.bottomAnchor, constant: UIScreen.main.bounds.height * (150.0 / 812)),
            redButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335.0 / 375),
            redButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 46.0 / 812)
        ])
        
        redButton.addAction(UIAction(handler: { [weak self ] action in
            self?.delegate?.changeColor(color: .red)
            self?.navigationController?.popToRootViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupBlueButton() {
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        blueButton.setTitle("ლურჯი", for: .normal)
        blueButton.titleLabel?.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (16.0 / 812))
        blueButton.backgroundColor = .systemBlue
        blueButton.layer.cornerRadius = UIScreen.main.bounds.height * (15.0 / 812)
        blueButton.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: UIScreen.main.bounds.height * (30.0 / 812)),
            blueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335.0 / 375),
            blueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 46.0 / 812)
        ])
        
        blueButton.addAction(UIAction(handler: { [weak self ] action in
            self?.delegate?.changeColor(color: .blue)
            self?.navigationController?.popToRootViewController(animated: true)
        }), for: .touchUpInside)
    }
    
}


