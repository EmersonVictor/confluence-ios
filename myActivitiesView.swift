//
//  myActivitiesView.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 28/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit

class myActivitiesView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myEventsTable: UITableView!
    
    let myEventsData = ["Event1", "Event2"]
    var idTarget = ""
    
    @IBAction func myActivitiesDestroy(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myEventsTable.delegate = self
        self.myEventsTable.dataSource = self
        self.myEventsTable.preservesSuperviewLayoutMargins = false
        self.myEventsTable.separatorInset = UIEdgeInsets.zero
        self.myEventsTable.layoutMargins = UIEdgeInsets.zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myEventsData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! TableViewCell
        
        
        
        cell.eventTitle.text = myEventsData[indexPath.row]
        cell.eventAddress.text = "Aqui"
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    /*
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! TableViewCell
        
        idTarget = cell.idCell
    }
    

    //MARK: - Open activity UIScreen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenActivitySearched" {
            if let destinationVC = segue.destination as? ThirdViewController {
                destinationVC.idActualEvent = idTarget
            }
        }
    }
*/
}
