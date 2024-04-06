//
//  Details.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class CharacterDetailsCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemGreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
    }
}
