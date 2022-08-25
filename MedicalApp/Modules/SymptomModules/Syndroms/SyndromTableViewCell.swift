//
//  SymptonTableViewCell.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 28.07.2022.
//

import Foundation
import UIKit

class SyndromTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "SyndromTableViewCell"
    
    private lazy var syndromLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
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
extension SyndromTableViewCell {
    private func setupConstraints() {
        contentView.addSubview(syndromLabel)
        NSLayoutConstraint.activate([
            syndromLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            syndromLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            syndromLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10),
            syndromLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 9/17),
        ])
    }
}

// MARK: - Configure cell
extension SyndromTableViewCell {
    func configure(symptom: String) {
        syndromLabel.text = symptom
    }
}
