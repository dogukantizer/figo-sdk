//
//  Aliases.swift
//  Figo
//
//  Created by Christian König on 03.12.15.
//  Copyright © 2015 figo GmbH. All rights reserved.
//


/**
 A closure which is used for API calls that return nothing
 */
public typealias VoidCompletionHandler = (FigoResult<Void>) -> Void

/**
 A closure which is called periodically during task state polling with a status message from the server
 
 - Parameter message: Status message or error message for currently processed account
 */
public typealias ProgressUpdate = (_ message: String) -> Void

/**
 A closure which is called when the server needs a PIN from the user to continue
 
 - Parameter message: Status message or error message for currently processed account
 - Parameter accountID: Account ID of currently processed account
 */
//public typealias PinResponder = (_ message: String, _ accountID: String) -> (pin: String, savePin: Bool)

public typealias PinResponder = (_ message: String, _ accountID: String, _ completion: @escaping (_ pin: String, _ savePin: Bool) -> (Void)) -> (pin: String, savePin: Bool)

/**
 A closure which is called when the server needs a response to a challenge from the user
 
 - Parameter message: Status message or error message for currently processed account
 - Parameter accountID: Account ID of currently processed account
 - Parameter challenge: Challenge object
 */
public typealias ChallengeResponder = (_ message: String, _ accountID: String, _ challenge: Challenge, _ completion: @escaping (_ tan:String) -> (Void)) -> String

public typealias ChallengeResponderr = (message: String, accountID: String, challenge: Challenge, completion: (_ tan:String) -> (Void))

