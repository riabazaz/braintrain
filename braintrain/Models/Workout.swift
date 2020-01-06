//
//  Workout.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/18/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct Workout: Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var date : String
    var exercises : [Exercise]
}
