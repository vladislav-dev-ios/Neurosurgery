//
//  Tumor.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 13.08.2022.
//

import Foundation

enum Tumor: String {
    case pilocyticAstrocytoma = "Пилоцитарная астроцитома"
    case fibrillarAstrocytoma = "Фибриллярная астроцитома"
    case anaplasticAstrocytoma = "Анапластическая астроцитома"
    case glioblastoma = "Глиобластома"
    case oligodendroglioma = "Олигодендроглиома"
}

struct TumorModel {
    let tumor: Tumor
    let percent: Int
}
