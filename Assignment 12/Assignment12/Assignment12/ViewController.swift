//
//  ViewController.swift
//  Assignment12
//
//  Created by Gegi Ghvachliani on 30.09.25.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var moonSunButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalButtonConfig()
    }
    
    @IBAction func moonSunButtonAction(_ sender: Any) {
        overrideUserInterfaceStyle = (overrideUserInterfaceStyle == .dark) ? .light : .dark

        let imageName = (overrideUserInterfaceStyle == .dark) ? "sun.max" : "moon"
            moonSunButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    private func equalButtonConfig() {
        equalButton.layer.shadowColor = UIColor.systemPink.cgColor
        equalButton.layer.shadowOpacity = 0.7
        equalButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        equalButton.layer.shadowRadius = 10
    }
}
