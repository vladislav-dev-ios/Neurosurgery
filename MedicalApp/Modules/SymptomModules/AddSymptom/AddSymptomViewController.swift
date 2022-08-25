//
//  SymptomsViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 28.07.2022.
//

import Foundation
import UIKit

class AddSymptomViewController : UIViewController {
    
    // MARK: - Properties
    private lazy var customView = AddSymptomView()
    
    weak var delegate: SymptomsDelegate?
    
    private var symptoms: [Symptom]
    private var currentSymptom : Symptom?
    
    // MARK: - Init
    init() {
        symptoms = Symptom.allCases
        symptoms.sort {
            $0.rawValue < $1.rawValue
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }

}

// MARK: - AddSymptomViewControllerDelegate
extension AddSymptomViewController: AddSymptomViewControllerDelegate {
    
    func retutnSymptomsCount() -> Int {
        return symptoms.count
    }
    
    func getSymptom(at row: Int) -> Symptom {
        return symptoms[row]
    }
    
    func selectSymptom(at row: Int) {
        currentSymptom = symptoms[row]
    }
    
    func addButtonTapped() {
        guard let currentSymptom = currentSymptom else {
            return
        }

        self.dismiss(animated: true) {
            self.delegate?.addSymptom(symptom: currentSymptom)
        }
    }
    
}
