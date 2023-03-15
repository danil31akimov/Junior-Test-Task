//
//  ViewController.swift
//  Junior-Test-Task
//
//  Created by Данил Акимов on 14.03.2023.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let mailsCollectionView = MailsCollectionView(frame: .zero,
                                                          collectionViewLayout: UICollectionViewFlowLayout())
    private let verificationButton = VerificationButton()
    
    private lazy var stackView = UIStackView(arrangedSubViews: [mailTextField,
                                                                verificationButton,
                                                                mailsCollectionView
                                                                ],
                                        axis: .vertical,
                                        spacing: 20)
    private let verificationModel = VerificationModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        mailsCollectionView.dataSource = self
        mailsCollectionView.selectMaildelegate = self
        mailTextField.textFieldDelegate = self
    }
    
    @objc
    func verificationButtonTapped() {
        print("verificationButtonTapped")
    }

}
// MARK: UICollectionViewDataSource
extension VerificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filtredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue, for: indexPath) as? MailsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let mailTextLabel = verificationModel.filtredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailTextLabel)
        return cell
    }
    
    
}
// MARK: ActionsMailTextFieldProtocol
extension VerificationViewController: ActionsMailTextFieldProtocol {
    func typingRext(text: String) {
        statusLabel.isValid = text.isValid()
        verificationButton.isValid = text.isValid()
        verificationModel.getfiltredMail(text: text)
        mailsCollectionView.reloadData()
    }
    
    func cleanOutTextField() {
        statusLabel.setDefaultSettings()
        verificationButton.setDefaultSettings()
        verificationModel.filtredMailArray = []
        mailsCollectionView.reloadData()
    }
    
    
}


// MARK: SelectProposedMailProtocol
extension VerificationViewController: SelectProposedMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = mailTextField.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filtredMailArray[indexPath.row]
        let mailFullname = verificationModel.nameMail + domainMail
        mailTextField.text = mailFullname
        statusLabel.isValid = mailFullname.isValid()
        verificationButton.isValid = mailFullname.isValid()
        verificationModel.filtredMailArray = []
        mailsCollectionView.reloadData()
    }
}


// MARK: SetConstraints
extension VerificationViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)


        ])
    }
    
}
