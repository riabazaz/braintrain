//
//  Select.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/12/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//


import SwiftUI


struct Select: View {
    var selectedmuscles : [MuscleGroup]
    
    var body: some View {

        ZStack{
            Color("Color-1")
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Add Exercises")
                .font(.title)
//            FilteredList(muscles: selectedmuscles) { (exercise: DatabaseExercise) in
//                Text("\(exercise.name ?? "unknown")")
//            }
            }
            
        }

    }
}

struct Select_Previews: PreviewProvider {
    static var previews: some View {
        Select(selectedmuscles: [MuscleGroup(name: "abdominals"), MuscleGroup(name: "abductors"), MuscleGroup(name: "adductors"), MuscleGroup(name: "biceps")])
    }
    
}
