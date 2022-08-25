//
//  ProtocolViewController + Delegate.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 23.08.2022.
//

import Foundation

protocol ProtocolViewControllerDelegate: AnyObject {
    
    func returnDescriptionsCount() -> Int
    func getDescription(at row: Int) -> Description
    func selectTumors(at row: Int)

    func selectButtonTapped()
}
