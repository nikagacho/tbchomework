//
//  AddNewItemToList.swift
//  Task17
//
//  Created by Nikoloz Gachechiladze on 29.10.23.
//

import UIKit

class AddNewItemToList: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//MARK: Properties
    
    private let mainStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        return mainStack
    }()
    
    private let mainTitle: UILabel = {
        let mainTitle = UILabel()
        mainTitle.text = "Upload a new TV Show"
        mainTitle.font = UIFont(name: "Helvetica-Bold", size: 26)
        mainTitle.textAlignment = .center
        return mainTitle
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.text = "Type the name of the TV Show"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload a Picture", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private var previewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    weak var delegate: AddNewItemDelegate?
    
//MARK: ViewDidLoad
    
    override func viewDidLoad() {
        setUpBackground()
        super.viewDidLoad()
        addSubviews()
        setUpStackView()
        setUpConstraints()
        setUpButtons()
        
    }
    
//MARK: Set Up and Logic Methods
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            previewImage.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 50),
            previewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            previewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            previewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    private func setUpStackView() {
        mainStackView.addArrangedSubview(mainTitle)
        mainStackView.addArrangedSubview(textField)
        mainStackView.addArrangedSubview(uploadButton)
        mainStackView.addArrangedSubview(saveButton)
        mainStackView.setCustomSpacing(40, after: mainTitle)
        mainStackView.setCustomSpacing(20, after: textField)
        mainStackView.setCustomSpacing(20, after: uploadButton)
    }
    
    private func setUpBackground() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(mainStackView)
        view.addSubview(previewImage)
    }
    
    private func saveButtonClicked() {
        
        if let text = textField.text?.trimmingCharacters(in: .whitespaces), !text.isEmpty {
            let imageName = text.lowercased().replacingOccurrences(of: " ", with: "_") + ".png"
            print("Image Name: \(imageName)")
            let newShow = tvShow(name: textField.text, imageName: imageName, imageData: previewImage.image?.pngData())
            print("Image data saved successfully")
            allShows.append(newShow)
            delegate?.didAddNewShow()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    private func setUpButtons() {
        let saveButtonAction = UIAction { [weak self] action in
            self?.saveButtonClicked()
        }
        let uploadButtonAction = UIAction { [weak self] action in
            self?.uploadButtonClicked()
        }
        
        saveButton.addAction(saveButtonAction, for: .touchUpInside)
        uploadButton.addAction(uploadButtonAction, for: .touchUpInside)
    }
    
    
    private func uploadButtonClicked() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            previewImage.image = selectedImage
            
            if let selectedIndex = allShows.firstIndex(where: { $0.name == textField.text }) {
                allShows[selectedIndex].imageData = selectedImage.pngData()
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}



