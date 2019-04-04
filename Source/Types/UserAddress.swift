//
//  Address.swift
//  Figo
//
//  Created by Christian König on 25.11.15.
//  Copyright © 2015 figo GmbH. All rights reserved.
//


public struct UserAddress: JSONObjectConvertible {
    
    public let city: String?
    public let company: String?
    public let postalCode: String?
    public let street: String?
    public let street2: String?
    public let country: String?
    public let vat: Float?
    public let bill: Bool?
    
    public init() {
        self.city = ""
        self.company = ""
        self.postalCode = ""
        self.street = ""
        self.street2 = ""
        self.country = ""
        self.vat = 0
        self.bill = false
    }
    
    var JSONObject: [String: AnyObject] {
        get {
            var dict = Dictionary<String, AnyObject>()
            
            dict["city"] = city as AnyObject?
            dict["company"] = company as AnyObject?
            dict["postal_code"] = postalCode as AnyObject?
            dict["street"] = street as AnyObject?
            dict["street2"] = street2 as AnyObject?
            dict["country"] = country as AnyObject?
            dict["vat"] = vat as AnyObject?
            dict["bill"] = bill as AnyObject?
            
            return dict
        }
    }
    
}

