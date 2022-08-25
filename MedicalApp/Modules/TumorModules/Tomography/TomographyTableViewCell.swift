//
//  TomographyTableViewCell.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 18.08.2022.
//

import Foundation
import UIKit

class TomographyTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "TomographyTableViewCell"
    
    private lazy var tomographyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var stateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private Methods
extension TomographyTableViewCell {
    private func setupConstraints() {
        contentView.addSubviews([
            tomographyLabel,
            stateImageView
        ])
        NSLayoutConstraint.activate([
            tomographyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            tomographyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    
            stateImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            stateImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stateImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2),
            stateImageView.widthAnchor.constraint(equalTo: stateImageView.heightAnchor)
        ])
    }
}

// MARK: - Configure cell
extension TomographyTableViewCell {
    func configure(tomography: String) {
        tomographyLabel.text = tomography
        
        if Manager.shared.tumors.keys.contains(where: { key in
            key == tomography
        }) {
            stateImageView.image = UIImage(named: "checkbox")
        } else {
            stateImageView.image = UIImage(named: "stop")
        }
    }
}

