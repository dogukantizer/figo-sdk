//
//  SyncStatus.swift
//  Figo
//
//  Created by Christian König on 25.11.15.
//  Copyright © 2015 CodeStage. All rights reserved.
//

import Unbox


public struct SyncStatus: Unboxable {
    
    public let code: Int
    public let message: String?
    public let successDate: FigoDate
    public let syncDate: FigoDate
    
    
    public init(unboxer: Unboxer) throws {
        code          = try unboxer.unbox(key: "code")
        message       = unboxer.unbox(key: "message")
        successDate   = try unboxer.unbox(key: "success_timestamp")
        syncDate      = try unboxer.unbox(key: "sync_timestamp")
    }
}
