//
//  JourneyTable.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 27/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit

class JourneyTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var journeyMenu: UITableView!

    let cellNames = ["searchAdd","path1","myActivities", "path2", "engagedActivities"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.journeyMenu.delegate = self
        self.journeyMenu.dataSource = self
        self.journeyMenu.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNames.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellNames[indexPath.row], for: indexPath)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 140
        } else if indexPath.row % 2 == 1 {
            return 90.0
        } else {
            return 140
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
