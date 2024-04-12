//
//  CustomTextField.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 12.04.2024.
//

import UIKit

class CustomTextField: UITextField {
    private let textFieldImageView = UIImageView()
    
    var placeholderText: String? {
        didSet {
            self.placeholder = placeholderText
        }
    }
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    var fontSize: CGFloat = 16 {
        didSet {
            self.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupTextFieldImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextFieldImageView() {
        let leftPaddingViewSize = CGFloat(48)
        let rightPaddingViewSize = CGFloat(16)
        let textFieldImageViewSize = CGFloat(24)
        textFieldImageView.image = UIImage(systemName: "magnifyingglass")
        textFieldImageView.contentMode = .scaleAspectFit
        textFieldImageView.frame = CGRect(x: leftPaddingViewSize/4, y: leftPaddingViewSize/4,
                                          width: textFieldImageViewSize, height: textFieldImageViewSize)
        let paddingView = UIView(frame: CGRectMake(0, 0, leftPaddingViewSize, leftPaddingViewSize))// Создаем пустое view для добавления отступа
        paddingView.addSubview(textFieldImageView)
        self.rightView = UIView(frame: CGRectMake(0, 0, rightPaddingViewSize, rightPaddingViewSize)) // Устанавливаем отступ справа
        self.rightViewMode = .always
        self.leftView = paddingView // Устанавливаем отступ с картинкой слева
        self.leftViewMode = .always
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
