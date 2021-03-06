//
//  TeamsChildVC.swift
//  Game On
//
//  Created by AFFIXUS IMAC1 on 2/3/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TeamsChildVC: UIViewController, IndicatorInfoProvider, UITableViewDataSource, UITableViewDelegate {
    
     let animals = ["", "", "", "", "", "", "", "", ""]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo{
        return IndicatorInfo(title: "TEAMS")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
