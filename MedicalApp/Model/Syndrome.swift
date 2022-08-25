import Foundation

struct Syndrome {
    
    let name: String
    let symptoms: [Symptom]
    
    static func getSyndromes() -> [Syndrome] {
        let syndromes: [Syndrome] = [
            Syndrome(name: "Гипертензионный синдром", symptoms: [.increasedIntracranialPressure]),
            Syndrome(name: "Гидроцефально-гипертензионный синдром – у детей", symptoms: [.increasedIntracranialPressure, .skullEnlargement]),
            Syndrome(name: "Общемозговом синдром ", symptoms: [.headache, .dizziness, .vomit]),
            Syndrome(name: "Поражение обонятельного нерва (I пара ЧМН)", symptoms: [.hyposmia, .anosmia]),
            Syndrome(name: "Поражение зрительного нерва (II пара ЧМН)", symptoms: [.hemianopia, .flashingFliesBeforeTheEyes]),
            Syndrome(name: "Поражение глазодвигательного нерва (III пара ЧМН)", symptoms: [.eyeMovementRestrictions]),
            Syndrome(name: "Поражение лицевого нерва (VII пара ЧМН)", symptoms: [.smoothingTheNasolabialFold, .asymmetryOfTheNasolabialFolds]),
            Syndrome(name: "Поражение преддверно-улиткового нерва (VIII пара ЧМН)", symptoms: [.imbalance, .hearingLoss]),
            Syndrome(name: "Поражение языкоглоточного нерва (IX пара ЧМН)", symptoms: [.dysphagia, .dysphonia, .dysarthria]),
            Syndrome(name: "Поражение подъязычного нерва (XII пара ЧМН)", symptoms: [.tongueDeviation]),
            Syndrome(name: "Синдром поражения лобной доли", symptoms: [.motorAphasia, .agraphia, .frontalAtaxia, .anosognosia]),
            Syndrome(name: "Синдром поражения теменной доли", symptoms: [.alexia, .apraxia, .acalculia]),
            Syndrome(name: "Синдром поражения височной доли", symptoms: [.sensoryAphasia, .amnesticAphasia, .olfactoryAgnosia, .auditoryAgnosia, .auditoryHallucinations]),
            Syndrome(name: "Синдром поражения затылочной доли", symptoms: [.visualAgnosia, .photopsies]),
            Syndrome(name: "Эпилептический синдром", symptoms: [.epilepticSeizures]),
            Syndrome(name: "Мозжечковая атаксия", symptoms: [.impairedCoordination, .unsteadinessWhenWalking])
        ]
        
        return syndromes
    }
}


