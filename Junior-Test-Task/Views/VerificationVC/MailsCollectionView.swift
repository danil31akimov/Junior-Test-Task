//
//  MailsCollectionView.swift
//  Junior-Test-Task
//
//  Created by Данил Акимов on 15.03.2023.
//

import UIKit

protocol SelectProposedMailProtocol: AnyObject {
    func selectProposedMail(indexPath: IndexPath)
}

enum IdCell: String {
    case idMailCell
}

class MailsCollectionView: UICollectionView {
    
    weak var selectMaildelegate: SelectProposedMailProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(MailsCollectionViewCell.self, forCellWithReuseIdentifier: IdCell.idMailCell.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        delegate = self

    }
}

// MARK: UICollectionViewDelegate
extension MailsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMaildelegate?.selectProposedMail(indexPath: indexPath)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MailsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5, height: 40)
    }
}
