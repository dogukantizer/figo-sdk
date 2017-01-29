//
//  PaymentParameters.swift
//  Figo
//
//  Created by Christian König on 25.11.15.
//  Copyright © 2015 CodeStage. All rights reserved.
//


public struct PaymentParameters: Unboxable {
    
    public let allowedRecipients: [String]?
    public let canBeRecurring: Bool
    public let canBeScheduled: Bool
    public let maxPurposeLength: Int
    public let supportedFileFormats: [String]
    public let supportedTextKeys: [Int]
    
    init(unboxer: Unboxer) throws {
        allowedRecipients     = unboxer.unbox(key: "allowed_recipients")
        canBeRecurring        = try unboxer.unbox(key: "can_be_recurring")
        canBeScheduled        = try unboxer.unbox(key: "can_be_scheduled")
        maxPurposeLength      = try unboxer.unbox(key: "max_purpose_length")
        supportedFileFormats  = try unboxer.unbox(key: "supported_file_formats")
        
        // Special treatment for the key "supported_text_keys" because the server sometimes sends
        // numbers and sometimes sends strings for the values
        let supportedTextKeysInt: [Int]? = unboxer.unbox(key: "supported_text_keys")
        let supportedTextKeysStrings: [String]? = unboxer.unbox(key: "supported_text_keys")
        if let textKeys = supportedTextKeysInt {
            supportedTextKeys = textKeys
        } else if let textKeys = supportedTextKeysStrings {
            supportedTextKeys = textKeys.map() { return Int($0) ?? 0 }
        } else {
            supportedTextKeys = []
        }
    }
}



