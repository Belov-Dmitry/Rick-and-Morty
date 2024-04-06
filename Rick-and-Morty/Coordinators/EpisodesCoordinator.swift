//
//  EpisodesCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
//import UIKit

class EpisodesCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemYellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
    }
}
