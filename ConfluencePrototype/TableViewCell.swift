//
//  TableViewCell.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 20/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventAddress: UILabel!
    
    var idCell:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //arrow.image = UIImage(named: "next.png")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
