//
//  User.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 27/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var id: String
    var username: String
    var profileImage: String
    var eventCriados: Repository
    var eventEngaged: Repository
    var eventDone: Repository
    
    init(id: String, username: String, profileImage: String){
        self.id = id
        self.username = username
        self.profileImage = profileImage
        eventCriados = Repository()
        eventEngaged = Repository()
        eventDone = Repository()
        super.init()
    }
    
    
}
