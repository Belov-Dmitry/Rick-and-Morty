//
//  EpisodeCell.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 19.04.2024.
//

import Foundation
import UIKit

class EpisodeCell: UICollectionViewCell {
    // MARK: - Properties
    
    let characterImageView = UIImageView()
    let nameLabel = UILabel()
    let backgroundGrayImageView = UIImageView()
    let episodeNameLabel = UILabel()
    let monitorImageView = UIImageView()
    let heartButton = UIButton()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure UI
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        // Add subviews
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(backgroundGrayImageView)
        contentView.addSubview(episodeNameLabel)
        contentView.addSubview(monitorImageView)
        contentView.addSubview(heartButton)
        
        // Configure subviews
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        episodeNameLabel.font = UIFont.systemFont(ofSize: 16)
//configure func replacement
        characterImageView.image = UIImage(named: "character")
        nameLabel.text = "Rick Sanchez"//name
        episodeNameLabel.text = "Pilot | S01E01"//episode
//end of configure func replacement
        backgroundGrayImageView.backgroundColor = UIColor.colorFromHexString(hex: "F9F9F9")
        backgroundGrayImageView.layer.cornerRadius = 16
        monitorImageView.image = UIImage(systemName: "play.tv")
        monitorImageView.tintColor = .black
        heartButton.setImage(UIImage(named: "HeartSVG"), for: .normal)
        
        
        // Auto layout
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundGrayImageView.translatesAutoresizingMaskIntoConstraints = false
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        monitorImageView.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            characterImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            characterImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            backgroundGrayImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            backgroundGrayImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundGrayImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundGrayImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundGrayImageView.heightAnchor.constraint(equalToConstant: 71),
            
            monitorImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            monitorImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 22),
            monitorImageView.widthAnchor.constraint(equalToConstant: 34),
            monitorImageView.heightAnchor.constraint(equalToConstant: 34),
            
            episodeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            episodeNameLabel.leftAnchor.constraint(equalTo: monitorImageView.rightAnchor, constant: 10),
            
            
            
            heartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            heartButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            heartButton.widthAnchor.constraint(equalToConstant: 40),
            heartButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with image: String, name: String, episodeName: String, episodeCode: String) {
        characterImageView.image = UIImage(named: image)
        nameLabel.text = name
        episodeNameLabel.text = episodeName + " | " + episodeCode
    }
    
}
