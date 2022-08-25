//
//  CustomButton.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 14.08.2022.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 0.05592339486, green: 0.4950674176, blue: 0.8700696826, alpha: 1)
        layer.masksToBounds = true
        layer.cornerRadius = 20
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitleColor(.white, for: .normal)
    }
    
}
