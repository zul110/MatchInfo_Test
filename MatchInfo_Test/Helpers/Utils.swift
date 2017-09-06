//
//  Utils.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import UIKit

// Static utilities
// Only contains a single function to show an alert
class Utils {
    static func showAlert(context: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayAction)
        
        context.present(alert, animated: true, completion: nil)
    }
}
