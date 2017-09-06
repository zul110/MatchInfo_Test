//
//  WicketModel.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import ObjectMapper

class WicketModel: Mappable {
    var order: Int?
    var over_ball: Double?
    var runs: Int?
    var player_name: String?
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.order          <- map["order"]
        self.over_ball      <- map["over_ball"]
        self.runs           <- map["runs"]
        self.player_name    <- map["player_name"]
    }
}
