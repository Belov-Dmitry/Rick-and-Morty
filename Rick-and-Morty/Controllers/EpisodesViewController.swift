//
//  Episodes.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 11.04.2024.
//

import Foundation
import UIKit

class EpisodesViewController: UIViewController {
    private var logoImageView = UIImageView()
    private var searchTextField = CustomTextField()
    private var filtersButton = UIButton()
    private var episodesCollectionView = UICollectionView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    
}
//MARK: - MakeUI()
extension EpisodesViewController {
    func makeUI() {
        view.backgroundColor = .white
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholderText = "Name or episode (ex.S01E01)..."
        searchTextField.cornerRadius = 10
        searchTextField.fontSize = 16
        view.addSubview(logoImageView)
        
        episodesCollectionView.backgroundColor = .white
        episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        episodesCollectionView.delegate = self
        episodesCollectionView.dataSource = self
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 67),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 56),
            
            filtersButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 67),
            filtersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            filtersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            filtersButton.heightAnchor.constraint(equalToConstant: 56),
            
            episodesCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            episodesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.backgroundColor = .systemPink
        return cell
    }
    
    
}
