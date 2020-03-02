//
//  MuscleGroup.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/5/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct MuscleGroup: Hashable, Codable, Identifiable {
    var id = UUID()
    var name : String
    init(name: String) {
        self.name = name
    }
}
