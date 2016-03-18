//
//  SupportedService.swift
//  Figo
//
//  Created by Christian König on 30.11.15.
//  Copyright © 2015 CodeStage. All rights reserved.
//


internal struct BanksListEnvelope: Unboxable {

    let banks: [SupportedBank]
    
    init(unboxer: Unboxer) {
        banks = unboxer.unbox("banks")
    }
}


public struct SupportedBank: Unboxable {
    
    public let bankName: String

    public let bankCode: Int?
    
    public let bic: String
    
    public let icon: [AnyObject]
    
    public let credentials: [LoginCredentials]
    
    public let advice: String?
    
    
    init(unboxer: Unboxer) {
        bankName    = unboxer.unbox("bank_name")
        bankCode    = unboxer.unbox("bank_code")
        bic         = unboxer.unbox("bic")
        icon        = unboxer.unbox("icon")
        credentials = unboxer.unbox("credentials")
        advice      = unboxer.unbox("advice")
    }
}

