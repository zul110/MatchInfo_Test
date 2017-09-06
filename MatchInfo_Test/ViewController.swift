//
//  ViewController.swift
//  MatchInfo_Test
//
//  Created by ZulMacPro on 9/6/17.
//  Copyright © 2017 dotZul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var matchTitleLabel: UILabel!
    @IBOutlet weak var matchSummaryLabel: UILabel!
    @IBOutlet weak var inningsTableView: UITableView!
    
    // MARK: Constants
    let fileName = "match_info"
    let reuseIdentifier = "inningCell"
    
    // MARK: Properties
    var matchInfoVM: MatchInfoViewModel! {
        didSet {
            // Once the view model has been set (initialized),
            // Set this ViewController as its delegate
            // And get the data
            self.matchInfoVM.setDelegate(delegate: self)
            self.matchInfoVM.getData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the view model
        self.matchInfoVM = MatchInfoViewModel(fileName: self.fileName)
    }
}

// MARK: Extensions

// Extensions could be kept in separate files,
// but for the sake of simplicity,
// they are in the same file as the ViewController class

extension ViewController: BaseViewModelDelegate {
    // Once the data is acquired, if it isn't nil, display it to the user
    func dataDidLoad() {
        if let matchData = self.matchInfoVM.matchInfo.data {
            self.matchTitleLabel.text = matchData.competition!
            self.matchSummaryLabel.text = matchData.summary!
            
            self.inningsTableView.dataSource = self
            self.inningsTableView.delegate = self
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfInnings = self.matchInfoVM.matchInfo.data?.innings?.count else {
            return 0
        }
        
        return numberOfInnings
    }
    
    // In real world scenario, a custom UITableViewCell would be created
    // and used (using nibs [.xib files]), instead of the default subtitle cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        let inning = self.matchInfoVM.matchInfo.data?.innings?[indexPath.row]
        
        let cellText = "\((inning?.batting_team)!) V \((inning?.bowling_team)!)"
        
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
        
        cell.textLabel?.text = cellText
        cell.detailTextLabel?.text = "\((inning?.wickets)!) wickets for \((inning?.runs_scored)!) runs in \((inning?.overs)!) overs"
        
        return cell
    }
    
    // The details should be shown in a new screen, but for the sake of simplicity,
    // and to save time, it is shown in an alert controller in this project
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inning = self.matchInfoVM.matchInfo.data?.innings?[indexPath.row]
        
        var wicketsInfo = ""
        
        for wicket in (inning?.fall_of_wickets)! {
            wicketsInfo += "Player: \((wicket.player_name)!)\n"
            wicketsInfo += "Runs: \((wicket.runs)!)\n"
            wicketsInfo += "Order: \((wicket.order)!)\n"
            wicketsInfo += "Over: \((wicket.over_ball)!)\n"
            wicketsInfo += "\n"
        }
        
        Utils.showAlert(context: self, title: "Wickets", message: wicketsInfo)
    }
}

