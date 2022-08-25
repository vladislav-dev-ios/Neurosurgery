//
//  TumorTableViewCell.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 18.08.2022.
//

import Foundation
import UIKit

class TumorTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "TumorTableViewCell"
    
    private let tumorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
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
extension TumorTableViewCell {
    private func setupConstraints() {
        contentView.addSubviews([
            tumorLabel,
            percentLabel
        ])
        NSLayoutConstraint.activate([
            tumorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            tumorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            percentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            percentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

// MARK: - Configure cell
extension TumorTableViewCell {
    
    func configure(tumor: String, percent: Int) {
        tumorLabel.text = tumor
        percentLabel.text = String(percent) + "%"
    }
}
