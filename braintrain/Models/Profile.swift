//
//  Profile.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/18/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct Profile : Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var workoutslogged: Int
    var workoutspredicted :Int
    
    init(name: String, workoutslogged: Int, workoutspredicted : Int, status : String) {
        self.name = name
        self.workoutslogged = workoutslogged
        self.workoutspredicted = workoutspredicted
    }
    
    
}
