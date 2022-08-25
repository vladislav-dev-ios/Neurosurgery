//
//  Tomography.swift
//  MedicalApp
//
//  Created by Владислав Кузьмичёв on 13.08.2022.
//

import Foundation

struct Tomography {
    
    let name: String
    let protocols: [TProtocol]
    
    static func createMRI() -> Tomography {
        var protocols = [TProtocol]()
        
        protocols.append(TProtocol.createT2_WIProtocol())
        protocols.append(TProtocol.createT1_WIProtocol())
        protocols.append(TProtocol.createFlairProtocol())
        protocols.append(TProtocol.createDWIProtocol())
        protocols.append(TProtocol.createT1_WI_CEProtocol())
        protocols.append(TProtocol.createT2Protocol())
        
        let mri = Tomography(name: "МРТ", protocols: protocols)
        
        return mri
    }
    
    static func createCT() -> Tomography {
        var protocols = [TProtocol]()
        
        protocols.append(TProtocol.createKTProtocol())
        protocols.append(TProtocol.createKtCeProtocol())
        
        let ct = Tomography(name: "КТ", protocols: protocols)
        
        return ct
    }
    
    static func createBasicTomography() -> [Tomography] {
        let mri = self.createMRI()
        let ct = self.createCT()
        
        var tomography = [Tomography]()
        tomography.append(mri)
        tomography.append(ct)
        
        return tomography
    }
    
}
