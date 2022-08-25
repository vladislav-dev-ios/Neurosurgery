//
//  SymptomsViewController + Delegate.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 25.08.2022.
//

import Foundation

protocol SymptomsViewControllerDelegate : AnyObject {
    func returnSymptomsCount() -> Int
    func getSymptom(at row: Int) -> Symptom
    
    func addButtonTapped()
    func nextButtonTapped()
    func deleteButtonTapped()
}
