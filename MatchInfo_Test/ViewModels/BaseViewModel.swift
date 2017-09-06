//
//  BaseViewModel.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import Foundation
import SwiftyJSON

// The main class that acquires the RAW data
// The derived classes parse the acquired raw data according to their needs
class BaseViewModel {
    // MARK: Properties
    var delegate: BaseViewModelDelegate!
    var fileName: String!
    var jsonData: JSON!
    
    // MARK: Constructor(s)
    init() { }
    
    // MARK: Member Functions
    func setDelegate(delegate: BaseViewModelDelegate) {
        self.delegate = delegate
    }
    
    // Main function that gets the data
    func readJsonFile() -> Data? {
        var data: Data?
        
        if let filePath = Bundle.main.path(forResource: self.fileName, ofType: "json") {
            do {
                data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            } catch {
                // Handle error
            }
        }
        
        return data
    }
    
    // MARK: Abstract Functions
    func getData() {
        preconditionFailure("Abstract function: BaseViewModel.getData()")
    }
    
    func displayData() {
        preconditionFailure("Abstract function: BaseViewModel.displayData()")
    }
    
    func deserializeData() {
        preconditionFailure("Abstract function: BaseViewModel.success(response:)")
    }
}
