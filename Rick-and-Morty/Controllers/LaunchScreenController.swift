//
//  LaunchScreen.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 04.04.2024.
//

import UIKit

final class LaunchScreenController: UIViewController {
    
    weak var launchScreenCoordinator: LaunchScreenCoordinator?
    private var logoImageView = UIImageView()
    private var loadingComponentImageView = UIImageView()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startAnimationAndGoToMainVC()
    }
    
    func startAnimationAndGoToMainVC() {
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveLinear, animations: {
            self.loadingComponentImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: { isFinished in
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveLinear, animations: {
                self.loadingComponentImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
            }, completion: { isFinished in
                print("End animation")
                self.launchScreenCoordinator?.showTabbar()
            })
        })
    }
}



//MARK: - extension LaunchScreenController
extension LaunchScreenController {
    func setupUI() {
        view.backgroundColor = .white
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        loadingComponentImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingComponentImageView.image = UIImage(named: "LoadingComponent")
        loadingComponentImageView.contentMode = .scaleAspectFit
        view.addSubview(loadingComponentImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            loadingComponentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingComponentImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingComponentImageView.widthAnchor.constraint(equalToConstant: 200),
            loadingComponentImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
