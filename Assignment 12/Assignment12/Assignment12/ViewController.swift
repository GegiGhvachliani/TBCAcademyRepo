//
//  ViewController.swift
//  Assignment12
//
//  Created by Gegi Ghvachliani on 30.09.25.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var moonSunButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moonSunButtonAction(_ sender: Any) {
        overrideUserInterfaceStyle = (overrideUserInterfaceStyle == .dark) ? .light : .dark
    }
}

