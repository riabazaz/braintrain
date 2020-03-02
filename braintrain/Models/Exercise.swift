//
//  Exercise.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/22/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI
import Firebase

struct Exercise: Hashable, Codable, Identifiable{
    var id = UUID()
    var name : String
    var sets : Int
    var reps : Int
    var weight: Int
    var time : Double
    var timeUsed : Bool
    
    init(name: String, sets: Int, reps: Int, weight: Int, time: Double, timeUsed : Bool){
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
        self.time = time
        self.timeUsed = timeUsed
    }
    
    func toAny() -> Any {
        return [
            "name" : name,
            "sets" : sets,
            "reps" : reps,
            "weight": weight,
            "time" : time,
            "timeUsed" : timeUsed
        ]
    }
    
}

//struct UserExercise : Identifiable {
//    let ref: DatabaseReference?
//    let key: String
//    var id : String
//    var name : String
//    var sets : Int
//    var reps : Int
//    var weight: Int
//    var time : Double
//    var timeUsed : Bool
//    
//    init(name: String, sets: Int, reps: Int, weight: Int, time: Double, timeUsed : Bool, key: String = ""){
//        self.ref = nil
//        self.name = name
//        self.sets = sets
//        self.reps = reps
//        self.weight = weight
//        self.time = time
//        self.timeUsed = timeUsed
//        self.id = key
//        self.key = key
//    }
//    
//    
//    init?(snapshot: DataSnapshot) {
//        guard
//            let value = snapshot.value as? [String: AnyObject],
//            let name = value["name"] as? String,
//            let sets = value["sets"] as? Int,
//            let reps = value["reps"] as? Int,
//            let weight = value["weight"] as? Int,
//            let time = value["time"] as? Double,
//            let timeUsed = value["timeUsed"] as? Bool
//
//        
//            else {
//                return nil
//            }
//        
//        self.ref = snapshot.ref
//        self.key = snapshot.key
//        self.name = name
//        self.sets = sets
//        self.reps = reps
//        self.weight = weight
//        self.id = snapshot.key
//        self.time = time
//        self.timeUsed = timeUsed
//         
//    }
//    
//
//    
//    func toAny() -> Any {
//        return [
//            "name" : name,
//            "sets" : sets,
//            "reps" : reps,
//            "weight": weight,
//            "time" : time,
//            "timeUsed" : timeUsed
//        ]
//    }
//}
