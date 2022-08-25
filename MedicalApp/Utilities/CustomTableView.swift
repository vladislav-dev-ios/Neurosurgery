//
//  CustomTableView.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 22.08.2022.
//

import Foundation
import UIKit

class CustomTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.cornerRadius = 10
        backgroundColor = #colorLiteral(red: 0.1069536582, green: 0.1441128552, blue: 0.2300903797, alpha: 1)
    }
    
    
}
