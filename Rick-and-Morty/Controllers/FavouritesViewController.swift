//
//  FavouritesViewController.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 25.04.2024.
//

import UIKit

class FavouritesViewController: UIViewController {
    // MARK: - Properties
    private var episodesCollectionView: UICollectionView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
}

//MARK: - MakeUI()
extension FavouritesViewController {
    func makeUI() {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        episodesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodesCollectionView.backgroundColor = .white
        episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        episodesCollectionView.delegate = self
        episodesCollectionView.dataSource = self
        episodesCollectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: String(describing: EpisodeCell.self))
        view.addSubview(episodesCollectionView)
        
        NSLayoutConstraint.activate([
            episodesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            episodesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            episodesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            episodesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCell.self), for: indexPath) as! EpisodeCell
        return cell
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.width * 1.15)
    }
}
