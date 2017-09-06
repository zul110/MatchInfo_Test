//
//  DataExtension.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import SwiftyJSON

// Extension for the Data type
// Contains a single function to convert the data to JSON type (from SwiftyJSON)
extension Data {
    func convertToJson() -> JSON {
        return JSON(data: self, options: .allowFragments, error: nil)
    }
}
