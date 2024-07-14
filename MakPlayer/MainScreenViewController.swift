//
//  MainScreenViewController.swift
//  MakPlayer
//
//  Created by Макей 😈 on 14.07.2024.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewForMainScreen()
        setupConstraintsForMainScreen()
    }
    
    private func setupViewForMainScreen() {
        backgroundImageView.image = UIImage(named: "")
    }
    
    private func setupConstraintsForMainScreen() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

        ])
    }
}
