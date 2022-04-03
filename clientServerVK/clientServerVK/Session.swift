//
//  Session.swift
//  clientServerVK
//
//  Created by Андрей Волков on 27.03.2022.
//

import Foundation

class Session {
    
    private init() {}
    
    static var shared = Session()
    
    var token = ""
    var userID = ""
}

