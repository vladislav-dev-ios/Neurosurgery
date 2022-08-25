//
//  Manager.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 17.08.2022.
//

import Foundation

final class Manager {
    
    private init() {}
    
    static let shared  = Manager()
    
    var tumors: [String:[Tumor]] = [:]
    var syndroms: [Syndrome] = []
    
}

extension Manager {
    
    func addTumor(for key: String, tumors: [Tumor]) {
        self.tumors[key] = tumors
    }
    
    func calculateProbalityOfResultTumors() -> [TumorModel] {
        var tumorsDict : [Tumor:Int] = [:]
        var allTumors = [Tumor]()
        
        for arrayTumor in tumors.values {
            for tumor in arrayTumor {
                allTumors.append(tumor)
            }
        }
        
        for allTumor in allTumors {
            if tumorsDict[allTumor] == nil {
                tumorsDict[allTumor] = 1
            } else {
                tumorsDict[allTumor] = tumorsDict[allTumor]! + 1
            }
        }
        
        let count = allTumors.count
        
        tumorsDict.map { (key: Tumor, value: Int) in
            tumorsDict[key] = Int(Double(value)/Double(count) * 100.0)
        }
        
        var models: [TumorModel] = []
        
        for key in tumorsDict.keys {
            let model = TumorModel(tumor: key, percent: tumorsDict[key]!)
            models.append(model)
        }
       
        return models
    }
}
