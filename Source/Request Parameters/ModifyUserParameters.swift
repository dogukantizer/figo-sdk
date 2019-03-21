//
//  CreateUserParameters.swift
//  Figo
//
//  Created by Christian König on 01.12.15.
//  Copyright © 2015 figo GmbH. All rights reserved.
//


/**
 
 Parameters for the endpoint CREATE NEW FIGO USER
 
 - Parameter name: **required** First and last name
 - Parameter email: **required** Email address; It must obey the figo username & password policy
 - Parameter password: **required** New figo Account password; It must obey the figo username & password policy
 - Parameter sendNewsletter: **optional** This flag indicates whether the user has agreed to be contacted by email (optional)
 - Parameter language: **optional** Two-letter code of preferred language (default: de)
 
 */
public struct ModifyUserParameters: JSONObjectConvertible {
    
    
    
    /// First and last name
    public let name: String
    
    /// Email address
    public let email: String
    
    /// This flag indicates whether the user has agreed to be contacted by email. Only available when calling with scope user=ro or better.
    public let sendNewsletter: Bool?
    
    /// Two-letter code of preferred language. Only available when calling with scope user=ro or better.
    public let language: String?
    
    
    public init(name: String, email: String, sendNewsletter: Bool? = false, language: String) {
        self.name = name
        self.email = email
        self.sendNewsletter = sendNewsletter
        self.language = language
        
    }
    
    var JSONObject: [String: AnyObject] {
        get {
            var dict = Dictionary<String, AnyObject>()
            
            dict["name"] = name as AnyObject?
            dict["language"] = language as AnyObject?
            dict["email"] = email as AnyObject?
            dict["send_newsletter"] = sendNewsletter as AnyObject?
            
            return dict
        }
    }
}

