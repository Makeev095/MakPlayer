//
//  MainScreenViewController.swift
//  MakPlayer
//
//  Created by Макей 😈 on 14.07.2024.
//

import UIKit
import AVFoundation

class MainScreenViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    private let albumImageView = UIImageView()
    private let songLabel = UILabel()
    private let playButton = UIButton()
    private let pauseButton = UIButton()
    private var player: AVAudioPlayer?
    private var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://swifteasy.ru/lessons/App003/start.mp3")
        downloadAudio(from: url!)
        
        setupViewForMainScreen()
        setupConstraintsForMainScreen()
    }
    
    private func downloadAudio(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                self.player = try AVAudioPlayer(data: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
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
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        
        pauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        pauseButton.contentMode = .scaleAspectFill
        pauseButton.addTarget(self, action: #selector(pauseButtonAction), for: .touchUpInside)
        
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(albumImageView)
        backgroundImageView.addSubview(songLabel)
        backgroundImageView.addSubview(playButton)
        backgroundImageView.addSubview(pauseButton)
        
    }
    
    private func setupConstraintsForMainScreen() {
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            playButton.leadingAnchor.constraint(equalTo: songLabel.leadingAnchor, constant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            playButton.heightAnchor.constraint(equalToConstant: 100),
            
            pauseButton.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 15),
            pauseButton.trailingAnchor.constraint(equalTo: songLabel.trailingAnchor, constant: 100),
            pauseButton.widthAnchor.constraint(equalToConstant: 100),
            pauseButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func playButtonAction() {
        player?.play()
        isPlaying = true
    }
    
    @objc private func pauseButtonAction() {
        player?.pause()
        isPlaying = false
    }
}
