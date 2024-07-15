//
//  MainScreenViewController.swift
//  MakPlayer
//
//  Created by Макей 😈 on 14.07.2024.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var backgroundImageView = UIImageView()
    private var albumImageView = UIImageView()
    private var songLabel = UILabel()
    private var playButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewForMainScreen()
        setupConstraintsForMainScreen()
    }
    
    private func setupViewForMainScreen() {
        
        backgroundImageView.image = UIImage(named: "MainBackgroundImage")
        backgroundImageView.contentMode = .scaleAspectFill
        
        albumImageView.image = UIImage(named: "AlbumImageView")
        backgroundImageView.bringSubviewToFront(albumImageView)
        
        songLabel.text = "MakPlayer Test Song"
        songLabel.textColor = .white
        songLabel.textAlignment = .center
        songLabel.numberOfLines = 0
        songLabel.font = UIFont(name: "Times New Roman", size: 25)
        
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.contentMode = .scaleAspectFill
//        playButton.addTarget(self, action: #, for: .touchUpInside)
        
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(albumImageView)
        backgroundImageView.addSubview(songLabel)
        backgroundImageView.addSubview(playButton)
        
    }
    
    private func setupConstraintsForMainScreen() {
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            albumImageView.widthAnchor.constraint(equalToConstant: 260),
            albumImageView.heightAnchor.constraint(equalToConstant: 260),
            albumImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            albumImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            albumImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            
            songLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 20),
            songLabel.leadingAnchor.constraint(equalTo: albumImageView.leadingAnchor),
            songLabel.trailingAnchor.constraint(equalTo: albumImageView.trailingAnchor),
            
            playButton.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 15),
//            playButton.leadingAnchor.constraint(equalTo: songLabel.leadingAnchor, constant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            playButton.heightAnchor.constraint(equalToConstant: 100)
            

        ])
    }
    
    @objc private func playButtonAction() {
        
    }
    
    // TEST ON MACBOOK
}
