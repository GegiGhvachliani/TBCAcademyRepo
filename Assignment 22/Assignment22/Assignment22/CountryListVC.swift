//
//  CountryListVC.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//

import UIKit

class CountryListVC: UIViewController {
    private var viewModel: CountryViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    init(viewModel: CountryViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupViewModel() {
        viewModel.countriesChanged = { [weak self] in
          //  self?.tableView.reloadData()
        }
    }
    
}

