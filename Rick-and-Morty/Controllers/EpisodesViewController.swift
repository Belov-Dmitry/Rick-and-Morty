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
    private var episodesCollectionView: UICollectionView!
    
    
    
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
        view.addSubview(searchTextField)
        
        filtersButton.translatesAutoresizingMaskIntoConstraints = false
        filtersButton.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        filtersButton.setTitle("ADVANCED FILTERS", for: .normal)
        filtersButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        filtersButton.setTitleColor(UIColor.colorFromHexString(hex: "2196F3"), for: .normal)
        filtersButton.imageEdgeInsets.left = -150
        filtersButton.titleEdgeInsets.left = -20
        filtersButton.tintColor = UIColor.colorFromHexString(hex: "686F73")
        filtersButton.backgroundColor = UIColor.colorFromHexString(hex: "#E3F2FD") //.gray
        filtersButton.layer.cornerRadius = 10
        filtersButton.layer.borderWidth = 2
        filtersButton.layer.borderColor = UIColor.systemGray5.cgColor
        filtersButton.clipsToBounds = true
        view.addSubview(filtersButton)
        
        let layout = UICollectionViewFlowLayout()
        episodesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodesCollectionView.backgroundColor = .white
        episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        episodesCollectionView.delegate = self
        episodesCollectionView.dataSource = self
        episodesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        view.addSubview(episodesCollectionView)
        
        NSLayoutConstraint.activate([
            //logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            //            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            //            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 56),
            
            filtersButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filtersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            filtersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            filtersButton.heightAnchor.constraint(equalToConstant: 56),
            
            episodesCollectionView.topAnchor.constraint(equalTo: filtersButton.bottomAnchor, constant: 20),
            episodesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            episodesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            episodesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        
    }
}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
        cell.backgroundColor = .systemPink
        return cell
    }
    
    
}
