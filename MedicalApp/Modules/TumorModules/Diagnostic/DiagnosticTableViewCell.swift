//
//  DiagnosticTableViewCekk.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 15.08.2022.
//

import Foundation
import UIKit

class DiagnosticTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "DiagnosticTableViewCell"
    
    private lazy var tomographyLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
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
extension DiagnosticTableViewCell {
    private func setupConstraints() {
        contentView.addSubview(tomographyLabel)
        NSLayoutConstraint.activate([
            tomographyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tomographyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tomographyLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10),
            tomographyLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 9/10),
        ])
    }
}

// MARK: - Configure cell
extension DiagnosticTableViewCell {
    func configure(tomography: String) {
        tomographyLabel.text = tomography
    }
}
