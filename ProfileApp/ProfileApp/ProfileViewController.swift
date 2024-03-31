//
//  ProfileViewController.swift
//  ProfileApp
//
//  Created by Matvei Khlestov on 31.03.2024.
//

import UIKit

// MARK: - ProfileViewController
final class ProfileViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var newPasswordTF: UITextField = {
        createTextField(
            placeholder: "Новый пароль",
            origin: CGPoint(
                x: 30,
                y: oldPasswordTF.frame.origin.y + 66
            ),
            size: CGSize(
                width: view.frame.width - 60,
                height: 52
            )
        )
    }()
    
    private lazy var oldPasswordTF: UITextField = {
        createTextField(
            placeholder: "Старый пароль",
            origin: CGPoint(
                x: 30,
                y: changePasswordLabel.frame.origin.y + 28
            ),
            size: CGSize(
                width: view.frame.width - 60,
                height: 52
            )
        )
    }()
    
    private lazy var changePasswordLabel: UILabel = {
        createLabel(
            text: "Изменить пароль",
            font: .systemFont(
                ofSize: 16,
                weight: .regular
            ),
            origin: CGPoint(
                x: 30,
                y: descriptionTextView.frame.origin.y + 183
            ),
            size: CGSize(
                width: 139,
                height: 19
            )
        )
    }()
    
    private lazy var addDescriptionLabel: UILabel = {
        createLabel(
            text: "Добавить описание",
            font: .systemFont(
                ofSize: 16,
                weight: .regular
            ),
            origin: CGPoint(
                x: 30,
                y: profileImageView.frame.origin.y + 152
            ),
            size: CGSize(
                width: 156,
                height: 19
            )
        )
    }()
    
    private lazy var fullNameLabel: UILabel = {
        createLabel(
            text: "Имя Фамилия",
            font: .systemFont(
                ofSize: 16,
                weight: .semibold
            ),
            origin: CGPoint(
                x: profileImageView.frame.origin.x + 116,
                y: headerImageView.frame.origin.y + 208
            ),
            size: CGSize(
                width: 113,
                height: 19
            )
        )
    }()
    
    private lazy var descriptionTextView: UITextView = {
        createTextView()
    }()
    
    private lazy var profileImageView: UIImageView = {
        createImageView(
            image: .profile,
            origin: CGPoint(
                x: 30,
                y: headerImageView.frame.origin.y + 189
            ),
            size: CGSize(
                width: 100,
                height: 100
            ),
            radius: 50
        )
    }()
    
    private lazy var headerImageView: UIImageView = {
        createImageView(
            image: .header,
            origin: CGPoint(
                x: 0,
                y: 0
            ),
            size: CGSize(
                width: view.frame.width,
                height: 156
            )
        )
    }()
    
    private lazy var saveButton: UIButton = {
        createButton(
            title: "Сохранить",
            origin: CGPoint(
                x: 30, y: view.frame.height - 107
            ),
            size: CGSize(
                width: view.frame.width - 60,
                height: 55
            )
        )
    }()
    
    private lazy var editButton: UIButton = {
        createButton(
            title: "Редактировать",
            origin: CGPoint(
                x: profileImageView.frame.origin.x + 116,
                y: fullNameLabel.frame.origin.y + 28
            ),
            size: CGSize(
                width: 147,
                height: 34
            )
        )
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private Methods
private extension ProfileViewController {
    func setupView() {
        view.backgroundColor = .white
        addSubviews()
    }
    
    func addSubviews() {
        setupSubviews(
            headerImageView,
            profileImageView,
            fullNameLabel,
            addDescriptionLabel,
            changePasswordLabel,
            oldPasswordTF,
            newPasswordTF,
            descriptionTextView,
            editButton,
            saveButton
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func createButton(title: String, origin: CGPoint, size: CGSize) -> UIButton {
        
        let button = UIButton(type: .system)
        button.frame = CGRect(origin: origin, size: size)
        button.backgroundColor = .customBlue
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        
        return button
    }
    
    func createImageView(image: UIImage, origin: CGPoint, size: CGSize, radius: CGFloat? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.frame = CGRect(origin: origin, size: size)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = radius ?? 0
        
        return imageView
    }
    
    func createTextView() -> UITextView {
        let origin = CGPoint(x: 30, y: addDescriptionLabel.frame.origin.y + 28)
        let size = CGSize(width: view.frame.width - 60, height: 150)
        
        let textView = UITextView()
        textView.backgroundColor = .background
        textView.frame = CGRect(origin: origin, size: size)
        textView.layer.cornerRadius = 20
        
        return textView
    }
    
    func createLabel(text: String, font: UIFont, origin: CGPoint, size: CGSize) -> UILabel {
        
        let label = UILabel()
        label.frame = CGRect(origin: origin, size: size)
        label.text = text
        label.font = font
        
        return label
    }
    
    func createTextField(placeholder: String, origin: CGPoint, size: CGSize) -> UITextField {
        
        let textField = UITextField()
        textField.backgroundColor = .background
        textField.frame = CGRect(origin: origin, size: size)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: textField.frame.height))
        textField.rightViewMode = .always
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10
        
        return textField
    }
}

