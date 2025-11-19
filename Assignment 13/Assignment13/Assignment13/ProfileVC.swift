//
//  ProfileVC.swift
//  Assignment13
//
//  Created by Gegi Ghvachliani on 03.10.25.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: properties
    
    private var lblForQuestion: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "120 x 3 + 608 + 1080"
           label.font = UIFont.systemFont(ofSize: 25)
           label.textColor = .systemGray2
           label.textAlignment = .right
        
        return label
    }()
    private var lblForAsnwer: UILabel = {
        var label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           
           label.text = "2,048"
           label.textColor = .label
           label.font = UIFont.systemFont(ofSize: 55, weight: .bold)
           label.textAlignment = .right
        
        return label
    }()
    //view for buttons
    private var buttonsView = UIView()
    // buttons with number
    private var button7 = UIButton()
    private var button4 = UIButton()
    private var button1 = UIButton()
    private var buttonAC = UIButton()
    
    private var button8 = UIButton()
    private var button5 = UIButton()
    private var button2 = UIButton()
    private var button0 = UIButton()
    
    private var button9 = UIButton()
    private var button6 = UIButton()
    private var button3 = UIButton()
    private var buttonDot = UIButton()
    
    // button with functions
    private var buttonDL = UIButton()
    private var buttonPercent = UIButton()
    private var buttonDivide = UIButton()
    private var buttonMultiply = UIButton()
    private var buttonMinus = UIButton()
    private var buttonPlus = UIButton()
    private var buttonEqual = UIButton()
    
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()

        
    }
    
    // MARK: Functions
    
    private func setupUI() {
        buttonsViewConfiguration()
        makeAllButtons()
        layoutButtons()
        lblForAsnwerConfiguration()
        lblForquestionConfiguration()
    }
    private func buttonsViewConfiguration() {
        view.addSubview(buttonsView)
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsView.backgroundColor = .systemGray5
        buttonsView.layer.cornerRadius = 34
        
        NSLayoutConstraint.activate([
            buttonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            buttonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 5.0/8.0),
        ])
    }
    
    func lblForAsnwerConfiguration() {
        view.addSubview(lblForAsnwer)
        
        NSLayoutConstraint.activate([
            lblForAsnwer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            lblForAsnwer.bottomAnchor.constraint(equalTo: buttonsView.topAnchor, constant: -40),
            lblForAsnwer.widthAnchor.constraint(equalToConstant: 200),
            lblForAsnwer.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func lblForquestionConfiguration() {
        view.addSubview(lblForQuestion)
        
        NSLayoutConstraint.activate([
            lblForQuestion.rightAnchor.constraint(equalTo: lblForAsnwer.rightAnchor),
            lblForQuestion.bottomAnchor.constraint(equalTo: lblForAsnwer.topAnchor, constant: -5),
            lblForQuestion.widthAnchor.constraint(equalToConstant: 250),
            lblForQuestion.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func makeButtonWith( title: String? = nil, symbolName: String? = nil, foregroundColor: UIColor = .label, weight: UIImage.SymbolWeight? = .medium ) -> UIButton {
        let button = UIButton()
        buttonsView.addSubview(button) // შესაცვლელია
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 34
        button.clipsToBounds = true
      
        if title != nil && symbolName == nil {
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(foregroundColor, for: .normal)
            
            button.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        } else {
            button.setImage(UIImage(systemName: symbolName ?? "error"), for: .normal)
            button.tintColor = foregroundColor
            button.backgroundColor = .systemGray3
            let symbolConfig = UIImage.SymbolConfiguration(pointSize: 27, weight: weight!)
            button.setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        }
        
       
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 64.0/498.0),
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
        ])
        
        return button
    }
    
    
    private func buttonRadiusForAllSize(_ button: UIButton) {
        
    }
    
    private func makeEqualButton() -> UIButton {
        let button = UIButton()
           buttonsView.addSubview(button)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.clipsToBounds = false
           
           button.setImage(UIImage(systemName: "equal"), for: .normal)
           button.tintColor = .white
           
           let symbolConfig = UIImage.SymbolConfiguration(pointSize: 34)
           button.setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        
           button.layer.shadowColor = UIColor.systemPink.cgColor
           button.layer.shadowOpacity = 0.5
           button.layer.shadowOffset = CGSize(width: 0, height: 4)
           button.layer.shadowRadius = 10
           
           NSLayoutConstraint.activate([
               button.widthAnchor.constraint(equalTo: button3.widthAnchor),
               button.heightAnchor.constraint(equalToConstant: 154)
           ])
           
           
           DispatchQueue.main.async {
               let gradient = CAGradientLayer()
               gradient.colors = [
                   UIColor(red: 0.93, green: 0.05, blue: 0.60, alpha: 1.0).cgColor,
                   UIColor(red: 1.0, green: 0.35, blue: 0.18, alpha: 1.0).cgColor
               ]
               gradient.startPoint = CGPoint(x: 0, y: 0)
               gradient.endPoint = CGPoint(x: 1, y: 1)
               gradient.frame = button.bounds
               gradient.cornerRadius = 34
               button.layer.insertSublayer(gradient, at: 0)
               
               
           }
           
           return button
    }
    
    func makeAllButtons() {
        buttonDL = makeButtonWith(symbolName: "moon", foregroundColor: .systemPink, weight: .heavy)
        buttonDL.addTarget(self, action: #selector(moonSunButtonAction), for: .touchUpInside)
        button7 = makeButtonWith(title: "7")
        button4 = makeButtonWith(title: "4")
        button1 = makeButtonWith(title: "1")
        buttonAC = makeButtonWith(title: "AC", foregroundColor: .systemPink)
        
        buttonPercent = makeButtonWith(symbolName: "percent")
        button8 = makeButtonWith(title: "8")
        button5 = makeButtonWith(title: "5")
        button2 = makeButtonWith(title: "2")
        button0 = makeButtonWith(title: "0")
        
        buttonDivide = makeButtonWith(symbolName: "divide")
        button9 = makeButtonWith(title: "9")
        button6 = makeButtonWith(title: "6")
        button3 = makeButtonWith(title: "3")
        buttonDot = makeButtonWith(title: ".")
        
        buttonMultiply = makeButtonWith(symbolName: "multiply")
        buttonMinus = makeButtonWith(symbolName: "minus")
        buttonPlus = makeButtonWith(symbolName: "plus")
        buttonEqual = makeEqualButton()
    }
    
    @objc func moonSunButtonAction(_ sender: Any) {
            overrideUserInterfaceStyle = overrideUserInterfaceStyle == .dark
        ? .light
        : .dark

            let imageName = overrideUserInterfaceStyle == .dark 
        ? "sun.max"
        : "moon"
                buttonDL.setImage(UIImage(systemName: imageName), for: .normal)
        }
    
        private func layoutButtons() {
            let sideToButtomSpace: CGFloat = 35.0
            let topToButtomSpace: CGFloat = 62.0
            let btmToBtmSpace: CGFloat = 17
    
            //first columnt (DL, 7, 4, 1)
            NSLayoutConstraint.activate([
                buttonDL.leftAnchor.constraint(equalTo: buttonsView.leftAnchor, constant: sideToButtomSpace),
                buttonDL.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: topToButtomSpace),
    
                button7.topAnchor.constraint(equalTo: buttonDL.bottomAnchor, constant: btmToBtmSpace),
                button7.centerXAnchor.constraint(equalTo: buttonDL.centerXAnchor),
    
                button4.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: btmToBtmSpace),
                button4.centerXAnchor.constraint(equalTo: button7.centerXAnchor),
    
                button1.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: btmToBtmSpace),
                button1.centerXAnchor.constraint(equalTo: button4.centerXAnchor),
                
                buttonAC.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: btmToBtmSpace),
                buttonAC.centerXAnchor.constraint(equalTo: button1.centerXAnchor)
            ])
            
            
            // second columnt (percent, 8, 5, 2, 0)
               NSLayoutConstraint.activate([
                   buttonPercent.leftAnchor.constraint(equalTo: buttonDL.rightAnchor, constant: btmToBtmSpace),
                   buttonPercent.topAnchor.constraint(equalTo: buttonDL.topAnchor),
                   
                   button8.topAnchor.constraint(equalTo: button7.topAnchor),
                   button8.centerXAnchor.constraint(equalTo: buttonPercent.centerXAnchor),
                   
                   button5.topAnchor.constraint(equalTo: button4.topAnchor),
                   button5.centerXAnchor.constraint(equalTo: button8.centerXAnchor),
                   
                   button2.topAnchor.constraint(equalTo: button1.topAnchor),
                   button2.centerXAnchor.constraint(equalTo: button5.centerXAnchor),
                   
                   button0.topAnchor.constraint(equalTo: buttonAC.topAnchor),
                   button0.centerXAnchor.constraint(equalTo: button2.centerXAnchor)
               ])

               // third coliumnt (divide, 9, 6, 3, .)
               NSLayoutConstraint.activate([
                   buttonDivide.leftAnchor.constraint(equalTo: buttonPercent.rightAnchor, constant: btmToBtmSpace),
                   buttonDivide.topAnchor.constraint(equalTo: buttonPercent.topAnchor),
                   
                   button9.topAnchor.constraint(equalTo: button8.topAnchor),
                   button9.centerXAnchor.constraint(equalTo: buttonDivide.centerXAnchor),
                   
                   button6.topAnchor.constraint(equalTo: button5.topAnchor),
                   button6.centerXAnchor.constraint(equalTo: button9.centerXAnchor),
                   
                   button3.topAnchor.constraint(equalTo: button2.topAnchor),
                   button3.centerXAnchor.constraint(equalTo: button6.centerXAnchor),
                   
                   buttonDot.topAnchor.constraint(equalTo: button0.topAnchor),
                   buttonDot.centerXAnchor.constraint(equalTo: button3.centerXAnchor)
               ])

               // fourth columnt (multiply, minus, plus, equal)
               NSLayoutConstraint.activate([
                   buttonMultiply.leftAnchor.constraint(equalTo: buttonDivide.rightAnchor, constant: btmToBtmSpace),
                   buttonMultiply.topAnchor.constraint(equalTo: buttonDivide.topAnchor),
                   
                   buttonMinus.topAnchor.constraint(equalTo: button9.topAnchor),
                   buttonMinus.centerXAnchor.constraint(equalTo: buttonMultiply.centerXAnchor),
                   
                   buttonPlus.topAnchor.constraint(equalTo: button6.topAnchor),
                   buttonPlus.centerXAnchor.constraint(equalTo: buttonMinus.centerXAnchor),
                   
                   buttonEqual.topAnchor.constraint(equalTo: button3.topAnchor),
                   buttonEqual.centerXAnchor.constraint(equalTo: buttonPlus.centerXAnchor)
               ])
        }
    }


#Preview {
    ProfileVC()
}
