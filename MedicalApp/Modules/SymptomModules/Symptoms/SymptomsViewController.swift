//
//  ViewController.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 05.07.2022.
//

import UIKit

protocol SymptomsDelegate : AnyObject {
    func addSymptom(symptom: Symptom)
}

class SymptomsViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var customView = SymptomsView()
    
    private var symptoms = [Symptom]() {
        didSet {
            customView.reloadTableViewData()
        }
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Клиническая картина"
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
}

// MARK: - SymptomsDelegate
extension SymptomsViewController: SymptomsDelegate {
    
    func addSymptom(symptom: Symptom) {
        symptoms.append(symptom)
    }
    
}

// MARK: - SymptomsViewControllerDelegate
extension SymptomsViewController: SymptomsViewControllerDelegate {

    func returnSymptomsCount() -> Int {
        return symptoms.count
    }
    
    func getSymptom(at row: Int) -> Symptom {
        return symptoms[row]
    }
    
    func deleteButtonTapped() {
        symptoms.removeAll()
    }
    
    func addButtonTapped() {
        let symptomsViewController = AddSymptomViewController()
        symptomsViewController.modalPresentationStyle = .fullScreen
        symptomsViewController.delegate = self
        self.present(symptomsViewController, animated: true)
    }
    
    func nextButtonTapped() {
        let syndromsViewController = SyndromsViewController(symptoms: symptoms)
        syndromsViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(syndromsViewController, animated: true)
    }
    
}
