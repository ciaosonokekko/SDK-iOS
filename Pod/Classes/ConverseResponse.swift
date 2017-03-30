//
//  ConverseResponse.swift
//
//  Created by Marcus Ataide on 1/23/17.
//  Copyright © 2017 Math. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

open class ConverseResponse: Mappable {
    
    public var uuid: String!
    public var source: String!
    public var replies: [String]?
    public var action: Action?
    public var next_actions: [Action]?
    public var memory: [String : Any]?
    public var entities: Entities?
    public var intents: [Intent]?
    public var conversation_token: String!
    public var language: String!
    public var timestamp: String!
    public var version: String!
    public var status: Int!
    
    required convenience public init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    open func mapping(map: Map) {
        uuid                <- map["uuid"]
        source              <- map["source"]
        replies             <- map["replies"]
        action              <- map["action"]
        next_actions        <- map["next_actions"]
        memory              <- map["memory"]
        entities            <- map["entities"]
        intents             <- map["intents"]
        conversation_token  <- map["conversation_token"]
        language            <- map["language"]
        timestamp           <- map["timestamp"]
        version             <- map["version"]
        status              <- map["status"]
    }
    
    //************ Methods - Global ************
    
    /**
     Get the first intent
     
     */
    public func reply() -> String? {
        if ((replies?.count) != nil) {
            return replies?[0]
        }
        return (nil)
    }
    
    /**
     Get the first next action
     
     */
    public func nextAction() -> Action? {
        if ((next_actions?.count) != nil) {
            return next_actions?[0]
        }
        return (nil)
    }
}

