//
//  MatchInfoModel.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import ObjectMapper

class MatchInfoModel: Mappable {
    var status: String?
    var data: DataModel?
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        self.status     <- map["status"]
        self.data       <- map["data"]
    }
}
