//
//  StandingOrder.swift
//  Figo
//
//  Created by Christian König on 02.12.15.
//  Copyright © 2015 CodeStage. All rights reserved.
//

import Unbox


public enum StandingOrderInterval: String, UnboxableEnum {
   
    case Weekly = "weekly"
    case Monthly = "monthly"
    case TwoMonthly = "two monthly"
    case Quarterly = "quarterly"
    case HalfYearly = "half yearly"
    case Yearly = "yearly"
    
    public static func unboxFallbackValue() -> StandingOrderInterval {
        return .Monthly
    }
    
}


internal struct StandingOrderListEnvelope: Unboxable {
    
    let standingOrders: [StandingOrder]
    
    init(unboxer: Unboxer) throws {
        standingOrders = try unboxer.unbox(key: "standing_orders")
    }
}


/**

 Bank accounts can have standing orders associated with it if supported by the respective bank. In general the information provided for each standing order should be roughly similar to the content of the printed or online standing order statement available from the respective bank. Please note that not all banks provide the same level of detail.
 
 EXECUTION DAY AND INTERVAL
 
 When working with standing orders you have to take some characteristics into account. If a last_execution_date is set, the standing order has a limited term and will not run indefinitely.
 
 If you want to identify the next execution date you have to use the interval and execution_day parameters to calculate the next execution date. Interval defines the regular cycle the standing order gets executed. Possible values are: weekly, monthly, two monthly, quarterly, half yearly or yearly.
 
 On top of it the execution_day states the day of execution within the interval. This value depends on the interval chosen. 
 
 * If the interval is set to weekly, possible values for execution_day are: 00 (daily), 01 (monday), 02 (tuesday) … 07 (sunday).
 * If the interval is set to one of the other possible values, execution_day could be: 01 - 30 (1st day of the month to 30th day of the month), 97 (closing of the month - 2), 98(closing of the month - 1) or 99 (closing of the month)
 
 REQUEST STANDING ORDERS
 
 Standing orders aren’t requested by default when a new bank account is setup. Make sure to add the value “standingOrder” to the sync_tasks list

*/
public struct StandingOrder: Unboxable {

    /// Internal figo Connect standing order ID
    let standingOrderID: String
    
    /// Internal figo Connect account ID
    let accountID: String
    
    /// First execution date of the standing order
    let firstExecutionDate: String
    
    /// Last execution date of the standing order. This field might be emtpy, if no last execution date is set
    let lastExecutionDate: String?
    
    /// The day the standing order gets executed
    let executionDay: String
    
    /// The interval the standing order gets executed. Possible values are weekly, monthly, two monthly, quarterly, half yearly and yearly
    let interval: StandingOrderInterval
    
    /// Name of recipient
    let name: String
    
    /// Account number recipient
    let accountNumber: String
    
    /// Bank code of recipient
    let bankCode: String
    
    /// Bank name of recipient
    let bankName: String
    
    /// Standing order amount in cents
    let amount: Int
    
    ///	Three-character currency code
    let currency: String
    
    /// Purpose text. This field might be empty if the standing order has no purpose.
    let purpose: String?
    
    /// Internal creation timestamp on the figo Connect server
    let creationDate: FigoDate
    
    /// Internal modification timestamp on the figo Connect server
    let modificationDate: FigoDate?
    
    
    public init(unboxer: Unboxer) throws {
        standingOrderID = try unboxer.unbox(key: "standing_order_id")
        accountID = try unboxer.unbox(key: "account_id")
        firstExecutionDate = try unboxer.unbox(key: "first_execution_date")
        lastExecutionDate = try unboxer.unbox(key: "last_execution_date")
        executionDay = try unboxer.unbox(key: "execution_day")
        interval = try unboxer.unbox(key: "interval")
        name = try unboxer.unbox(key: "name")
        accountNumber = try unboxer.unbox(key: "account_number")
        bankCode = try unboxer.unbox(key: "bank_code")
        bankName = try unboxer.unbox(key: "bank_name")
        amount = try unboxer.unbox(key: "amount")
        currency = try unboxer.unbox(key: "currency")
        purpose = try unboxer.unbox(key: "purpose")
        creationDate = try unboxer.unbox(key: "creation_timestamp")
        modificationDate = try unboxer.unbox(key: "modification_timestamp")
    }
}

