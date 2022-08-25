//
//  ResultViewController + Delegate.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 18.08.2022.
//

import Foundation

protocol ResultViewControllerDelegate: AnyObject {
    
    func returnSyndromsCount() -> Int
    func getSyndrome(at row: Int) -> Syndrome
    
    func returnTumorsCount() -> Int
    func getTumor(at row: Int) -> TumorModel
}
