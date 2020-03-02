//
//  Workout.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/18/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//
import Firebase
import FirebaseDatabase
import SwiftUI

struct Workout: Identifiable,Codable {
    var id = UUID()
    var name : String
    var date : String
    var exercises : [Exercise]
}

struct UserWorkout: Identifiable {
    var id = UUID()
    var ref : DatabaseReference?
    var key : String
    var name : String
    var date : String
    var predicted : Bool
    var exercises : [Any]
    
    init(name: String, key: String = "", exercises: [Any], date: String, predicted: Bool) {
        self.ref = nil
        self.key = key
        self.name = name
        self.date = date
        self.predicted = predicted
        self.exercises = exercises
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String : AnyObject],
            let name = value["name"] as? String,
            let date = value["date"] as? String,
            let predicted = value["predicted"] as? Bool,
            let exercises = value["exercise"] as? Array<Any>
            else  {
                return nil
            }
            var temp = [Exercise]()
        
            for case let item as Dictionary<String, Any> in exercises {
                temp.append(Exercise(name: item["name"] as! String, sets: item["sets"] as! Int, reps: item["reps"] as! Int, weight: item["weight"] as! Int, time: item["time"] as! Double, timeUsed: (item["timeUsed"] != nil)))
                
            }

//            ref.child("exercises").observe(DataEventType.value) { (snapshot) in
//                var exer = []
//                for child in snapshot.children {
//                    print(child)
//                    if let snapshot = child as? DataSnapshot,
//                        let exercise = UserExercise(snapshot: snapshot) {
//                        self.exer.append(exercise)
//                    }
//                }
//            }
            
        self.key = snapshot.key
        self.ref = nil
        self.key = snapshot.key
        self.name = name
        self.date = date
        self.predicted = predicted
        self.exercises = temp
//        for child in snapshot.value?["exercises"] {
//            print(child)
//            if let ex = child as? DataSnapshot,
//                let exercise = UserExercise(snapshot: ex) {
//                self.exercises.append(exercise)
//            }
//        }
        
    }
        
    
    
    
    
    func toAny() -> Any {
        return [
            "name" : name,
            "date" : date,
            "predicted" : predicted,
            "exercise" : exercises
        
        ]
    }
}


