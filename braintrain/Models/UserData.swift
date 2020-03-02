//
//  UserData.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/21/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//


import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var workouts = workoutData
    @Published var profile = profileData[0]
}

