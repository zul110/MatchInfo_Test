//
//  DataModel.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import ObjectMapper

class DataModel: Mappable {
    var started: Bool?
    var finished: Bool?
    var summary: String?
    var competition: String?
    var event_id: Int?
    var start_time: Date?
    var status: String?
    var match_day: Int?
    var innings: [InningModel]?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.started       <- map["started"]
        self.finished      <- map["finished"]
        self.summary       <- map["summary"]
        self.competition   <- map["competition"]
        self.event_id      <- map["event_id"]
        self.start_time    <- map["start_time"]
        self.status        <- map["status"]
        self.match_day     <- map["match_day"]
        self.innings       <- map["innings"]
    }
}

