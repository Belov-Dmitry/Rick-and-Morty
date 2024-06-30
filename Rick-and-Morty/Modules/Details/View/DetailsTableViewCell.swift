//
//  DetailsTableViewCell.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 24.06.2024.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, value: String) {
        titleLabel.text = title
        if value == "" {
            valueLabel.text = "Unknown"
        } else {
            valueLabel.text = value
        }
    }
    
    func setupUI() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            valueLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
            //valueLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}

