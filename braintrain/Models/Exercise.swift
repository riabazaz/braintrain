//
//  Exercise.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/22/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct Exercise: Hashable, Codable, Identifiable{
    var id : Int
    var name : String
    var sets : Int
    var reps : Int
    var weight: Int
    var time : Double
    var timeUsed : Bool
    
    
}
