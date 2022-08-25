//
//  Protocols.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 13.08.2022.
//

import Foundation

struct TProtocol {
    
    let name: String
    let descriptions: [Description]
    
    static func createT2_WIProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Солидный компонент изо-/гипоинтенсивен по отношению к серому веществу ", tumors: [.pilocyticAstrocytoma]))
        descriptions.append(Description(name: "Гомогенное гиперинтенсивное объемное образование", tumors: [.fibrillarAstrocytoma]))
        descriptions.append(Description(name: "Гетерогенное гиперинтенсивное объемное образование", tumors: [.anaplasticAstrocytoma]))
        descriptions.append(Description(name: "Гетерогенное гиперинтенсивное объемное образование с перифокальной инфильтрацией/вазогенным отеком ", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Гетерогенное гиперинтенсивное объемное образование, ограниченное от окружающих структур с минимальным перифокальным отеком", tumors: [.oligodendroglioma]))
        
        let tProtocol = TProtocol(name: "Т2-ВИ", descriptions: descriptions)
        
        return tProtocol
    }
    
    static func createT1_WIProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Солидный компонент изо-/гипоинтенсивен по отношению к серому веществу", tumors: [.pilocyticAstrocytoma]))
        descriptions.append(Description(name: "Гомогенное гипоинтенсивное объемное образование", tumors: [.fibrillarAstrocytoma]))
        descriptions.append(Description(name: "Объемное образование со смешанным сигналом,от изо-интенсивного до гипоинтенсивного", tumors: [.anaplasticAstrocytoma]))
        descriptions.append(Description(name: "Неравномерное изоинтенсивное, гипоинтенсивное объемное образование", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Объемное образование от гипо- до изоинтенсивного по отношению к серому веществу сигнала", tumors: [.oligodendroglioma]))
        
        let tPtotocol = TProtocol(name: "T1-ВИ", descriptions: descriptions)
        
        return tPtotocol
    }
    
    static func createFlairProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Солидный компонент гиперинтенсивен по отношению к серому веществу", tumors: [.pilocyticAstrocytoma]))
        descriptions.append(Description(name: "Гомогенное гиперинтенсивное объемное образование", tumors: [.fibrillarAstrocytoma]))
        descriptions.append(Description(name: "Гетерогенное гиперинтенсивное объемное образование", tumors: [.anaplasticAstrocytoma]))
        descriptions.append(Description(name: "Гетерогенное гиперинтенсивное объемное образование с перифокальными инфильтрацией/вазогенным отеком ", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Гетерогенное гиперинтенсивное объемное образование,ограниченное от окружающих структур,инфильтративный тип роста", tumors: [.oligodendroglioma]))
        
        let tProtocol = TProtocol(name: "FLAIR", descriptions: descriptions)

        return tProtocol
    }
    
    static func createDWIProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Степень диффузии в солидном компоненте опухоли сходна с серым веществом", tumors: [.pilocyticAstrocytoma]))
        descriptions.append(Description(name: "Характерно отсутствие ограничения диффузии", tumors: [.fibrillarAstrocytoma, .anaplasticAstrocytoma, .oligodendroglioma]))
        descriptions.append(Description(name: "Вариабельное ограничение диффузии в области солидной части опухоли", tumors: [.glioblastoma]))

        let tProtocol = TProtocol(name: "ДВИ", descriptions: descriptions)

        return tProtocol
    }
    
    static func createT1_WI_CEProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Интенсивное гетерогенное контрастирование солидного компонента", tumors: [.pilocyticAstrocytoma]))
        descriptions.append(Description(name: "Не накапливает контраст", tumors: [.anaplasticAstrocytoma, .fibrillarAstrocytoma]))
        descriptions.append(Description(name: "Неравномерное кольцевое контрастирование вокруг некротического ядра", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Характерно гетерогенное контрастирование ", tumors: [.oligodendroglioma]))
        
        let tProtocol = TProtocol(name: "Т1-ВИ с КУ", descriptions: descriptions)

        return tProtocol
    }
    
    static func createT2Protocol() ->TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Артефакт восприимчивости, связанный с продуктами распада крови", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Визуализируются кальцификаты как участки «выцветания» изображения", tumors: [.oligodendroglioma]))
        
        let tProtocol = TProtocol(name: "Т2* GRE", descriptions: descriptions)

        return tProtocol
    }

    static func createKTProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Слабо-определяемое гиподенсное объемное образование", tumors: [.anaplasticAstrocytoma]))
        descriptions.append(Description(name: "Неравномерно изоденсное или гиподенсное объемное образование с гиподенсной центральной частью, отражающей некроз / Выраженные масс-эффект и перифокальные отек/опухолевая инфильтрация", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Объемное образование смешанной КТ-плотности характеризуются кальцификацией узлового или мультиочагового характера", tumors: [.oligodendroglioma]))
        
        let tProtocol = TProtocol(name: "КТ без контраста", descriptions: descriptions)

        return tProtocol
    }

    static func createKtCeProtocol() -> TProtocol {
        var descriptions = [Description]()
        
        descriptions.append(Description(name: "Контрастирование фрагментарное, гетерогенное", tumors: [.anaplasticAstrocytoma]))
        descriptions.append(Description(name: "Высокоинтенсивное гетерогенное неравномерное кольцевое контрастирование", tumors: [.glioblastoma]))
        descriptions.append(Description(name: "Отмечается контрастное усиление образования", tumors: [.oligodendroglioma]))
        
        let tProtocol = TProtocol(name: "КТ с КУ", descriptions: descriptions)

        return tProtocol
    }
    
}
