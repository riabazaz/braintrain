//
//  Profile.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/18/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct Profile : Hashable, Codable, Identifiable {
    var id : Int
    var name: String
    var workoutslogged: Int
    var workoutspredicted :Int
    var status : String
    
    init(id: Int, name: String, workoutslogged: Int, workoutspredicted : Int, status : String) {
        self.id = id
        self.name = name
        self.workoutslogged = workoutslogged
        self.workoutspredicted = workoutspredicted
        self.status = status
    }
    
    
}
