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
    
    /// Internal figo Connect user ID. Only available when calling with scope user=ro or better.
    public let userID: String?
    
    /// First and last name
    public let name: String
    
    /// Email address
    public let email: String
    
    /// Postal address for bills, etc. Only available when calling with scope user=ro or better.
    public let address: Address?
    
    /// This flag indicates whether the email address has been verified. Only available when calling with scope user=ro or better.
    public let verifiedEmail: Bool?
    
    /// This flag indicates whether the user has agreed to be contacted by email. Only available when calling with scope user=ro or better.
    public let sendNewsletter: Bool?
    
    /// Timestamp of figo Account registration. Only available when calling with scope user=ro or better.
    public let joinDate: FigoDate?
    
    /// Two-letter code of preferred language. Only available when calling with scope user=ro or better.
    public let language: String?
    
    /// This flag indicates whether the figo Account plan is free or premium. Only available when calling with scope user=ro or better.
    public let premium: Bool?
    
    /// Timestamp of premium figo Account expiry. Only available when calling with scope user=ro or better.
    public let premiumExpiresOn: FigoDate?
    
    /// Provider for premium subscription or Null if no subscription is active. Only available when calling with scope user=ro or better.
    public let premiumSubscription: String?
    
    /// If this flag is set then all local data must be cleared from the device and re-fetched from the figo Connect server. Only available when calling with scope user=ro or better.
    public let forceReset: Bool?
    

    public init(name: String, email: String, sendNewsletter: Bool? = false, language: String, userId: String, address: Address, verifiedEmail: Bool? = false, joinDate:FigoDate, premium: Bool?, premiumExpiresOn:FigoDate, premiumSubscription:String, forceReset:Bool? ) {
        self.name = name
        self.email = email
        self.sendNewsletter = sendNewsletter
        self.language = language
        self.userID = userId
        self.address = address
        self.verifiedEmail = verifiedEmail
        self.joinDate = joinDate
        self.premium = premium
        self.premiumExpiresOn = premiumExpiresOn
        self.premiumSubscription = premiumSubscription
        self.forceReset = forceReset
    }
    
    var JSONObject: [String: AnyObject] {
        get {
            var dict = Dictionary<String, AnyObject>()
            
            dict["name"] = name as AnyObject?
            dict["email"] = email as AnyObject?
            dict["send_newsletter"] = sendNewsletter as AnyObject?
            dict["language"] = language as AnyObject?
            dict["user_id"] = userID as AnyObject?
            dict["address"] = address as AnyObject?
            dict["verified_email"] = verifiedEmail as AnyObject?
            dict["join_date"] = joinDate as AnyObject?
            dict["premium"] = premium as AnyObject?
            dict["premium_expires_on"] = premiumExpiresOn as AnyObject?
            dict["premium_subscription"] = premiumSubscription as AnyObject?
            dict["force_reset"] = forceReset as AnyObject?
            
            return dict
        }
    }
}
