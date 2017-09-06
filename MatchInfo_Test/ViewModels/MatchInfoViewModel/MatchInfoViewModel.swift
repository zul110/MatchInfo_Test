//
//  MatchInfoViewModel.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

// Derived View Model from the Base View Model
// Parses the data into Match Info object
class MatchInfoViewModel: BaseViewModel {
    var matchInfo: MatchInfoModel!
    
    init(fileName: String) {
        super.init()
        self.fileName = fileName
    }
    
    // This function is overridden to manipulate the data
    // as required by this particular derived view model
    // Currently, it just contains the basic functionality:
    // to read the file, decode the contents into JSON format,
    // and to deserialize the json data into match info object
    override func getData() {
        print("MatchInfoVM getData")
        
        if let jsonData = self.readJsonFile() {
            self.jsonData = jsonData.convertToJson()
            self.deserializeData()
        } else {
            // File could not be read
        }
    }
    
    // Deserializes the data according to the requirements of
    // this particular derived class
    // Currently it just deserializes the data into the match info object
    // and raises the dataDidLoad event
    override func deserializeData() {
        print(self.jsonData.rawString()!)
        
        self.matchInfo = Mapper<MatchInfoModel>().map(JSONObject: self.jsonData.object)
        
        self.delegate.dataDidLoad()
    }
    
    // Display the data if required for debugging purposes
    // Left it empty, as it is not needed for this project
    override func displayData() {
        print("MatchInfoVM displayData")
    }
}
