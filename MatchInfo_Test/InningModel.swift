//
//  InningModel.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import ObjectMapper

class InningModel: Mappable {
    var batting_team: String?
    var bowling_team: String?
    var overs: Int?
    var runs_scored: Int?
    var wickets: Int?
    var declared: Bool?
    var fall_of_wickets: [WicketModel]?
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.batting_team        <- map["batting_team"]
        self.bowling_team        <- map["bowling_team"]
        self.overs               <- map["overs"]
        self.runs_scored         <- map["runs_scored"]
        self.wickets             <- map["wickets"]
        self.declared            <- map["declared"]
        self.fall_of_wickets     <- map["fall_of_wickets"]
    }
}
