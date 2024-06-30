//
//  DetailsViewController.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 16.06.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    
    //MARK: - Properties
    private var logoImageView = UIImageView()
    private var characterImageView = UIImageView()
    private let cameraButton = UIButton()
    private let nameCharacterLabel = UILabel()
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    
    var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupUI()
    }
    
    init(viewModel: DetailsViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods - setupUI
    func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonTitle = "GO BACK"
        
        setupLogoImageView()
        setupImageView()
        setupCameraButton()
        setupNameCharacterLabel()
        setupTitleLabel()
        
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: String(describing: DetailsTableViewCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
}
// MARK: - Extension
extension DetailsViewController {
    //MARK: - Image
    func setupLogoImageView() {
        let image = UIImage(named: "logo-black")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
        //         logoImageView.translatesAutoresizingMaskIntoConstraints = false
        //         logoImageView.image = UIImage(named: "logo-black")
        //         logoImageView.frame.size = CGSize(width: 46, height: 44)
        //         logoImageView.contentMode = .scaleAspectFill
        //         logoImageView.clipsToBounds = true
        //         view.addSubview(logoImageView)
        //
        //         NSLayoutConstraint.activate([
        //             logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -44),
        //             logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //         ])
    }
    //MARK: - Image
    func setupImageView() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.image = viewModel?.characterImage
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = 74
        characterImageView.layer.borderWidth = 5
        characterImageView.layer.borderColor = UIColor.systemGray5.cgColor
        characterImageView.clipsToBounds = true
        view.addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 148),
            characterImageView.widthAnchor.constraint(equalToConstant: 148)
        ])
    }
    //MARK: - Camera
    func setupCameraButton(){
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraButton.tintColor = .black
        cameraButton.clipsToBounds = true
        cameraButton.contentMode = .scaleAspectFill
        let cameraButtonTap = UITapGestureRecognizer(target: self, action: #selector(self.cameraButtonTap(_:)))
        self.cameraButton.isUserInteractionEnabled = true
        self.cameraButton.addGestureRecognizer(cameraButtonTap)
        view.addSubview(cameraButton)
        NSLayoutConstraint.activate([
            cameraButton.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor),
            cameraButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10),
            cameraButton.heightAnchor.constraint(equalToConstant: 32),
            cameraButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    //MARK: Camera_Alert
    @objc func cameraButtonTap(_ sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Выберите действие", message: "Хотите сделать фото или выбрать из галереи?", preferredStyle: .actionSheet)
        let takePhotoAction = UIAlertAction(title: "Сделать фото", style: .default) { (_) in
            self.handleTakePhoto()
        }
        let chooseFromGalleryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { (_) in
            self.handleChooseFromGallery()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromGalleryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        print(#function)
    }
    private func handleTakePhoto() {
        // для запуска камеры
    }
    private func handleChooseFromGallery() {
        // для доступа к галерее
    }
    //MARK: - Name
    func setupNameCharacterLabel() {
        nameCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCharacterLabel.textAlignment = .center
        nameCharacterLabel.font = UIFont.systemFont(ofSize: 32)
        nameCharacterLabel.text = viewModel?.characterName
        nameCharacterLabel.textColor = .black
        view.addSubview(nameCharacterLabel)
        
        NSLayoutConstraint.activate([
            nameCharacterLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    //MARK: - Title
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "Informations"
        titleLabel.textColor = .gray
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
//MARK: - UITableViewDataSource, UITableViewDelegate
extension DetailsViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (viewModel?.detailsData.count ?? 1) * 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsTableViewCell.self), for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsTableViewCell.self), for: indexPath) as! DetailsTableViewCell
        
        let item = viewModel?.detailsData[indexPath.row / 6]
        let fieldIndex = indexPath.row % 6
        
        var title = ""
        var value = ""
        
        switch fieldIndex {
        case 0:
            title = "Gender"
            value = item?.characterGender ?? "Unknown"
        case 1:
            title = "Status"
            value = item?.characterStatus ?? "Unknown"
        case 2:
            title = "Species"
            value = item?.characterSpecies ?? "Unknown"
        case 3:
            title = "Origin"
            value = item?.characterOrigin.name ?? "Unknown"
        case 4:
            title = "Type"
            value = item?.characterType ?? "Unknown"
        case 5:
            title = "Location"
            value = item?.characterLocation.name ?? "Unknown"
        default:
            break
        }
           
        cell.configure(title: title, value: value)
        
        return cell
    }
    
    
}
