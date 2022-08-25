//
//  AddSymptomViewController + Delegate.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 24.08.2022.
//

import Foundation

protocol AddSymptomViewControllerDelegate: AnyObject {
    
    func retutnSymptomsCount() -> Int
    func getSymptom(at row: Int) -> Symptom
    func addButtonTapped()
    func selectSymptom(at row: Int)
    
}
