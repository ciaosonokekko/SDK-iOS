//
//  ConverseResponse.swift
//
//  Created by Marcus Ataide on 1/23/17.
//  Copyright © 2017 Math. All rights reserved.
//

import UIKit
import ObjectMapper

open class ConverseResponse: Mappable {
    
    var uuid: String!
    var source: String!
    var replies: [String]?
    var action: [String : Any]?
    var next_actions: [Any]?
    var memory: [String : Any]?
    var entities: [String : Any]?
    var intents: [Any]?
    var conversation_token: String!
    var language: String!
    var timestamp: String!
    var version: String!
    var status: Int!
    
    required convenience public init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    open func mapping(map: Map) {
        uuid <- map["uuid"]
        source <- map["source"]
        replies <- map["replies"]
        action <- map["action"]
        next_actions <- map["next_actions"]
        memory <- map["memory"]
        entities <- map["entities"]
        intents <- map["intents"]
        conversation_token <- map["conversation_token"]
        language <- map["language"]
        timestamp <- map["timestamp"]
        version <- map["version"]
        status <- map["status"]
    }
    
    
}

