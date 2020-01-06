//
//  SmallWorkoutDetail.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/31/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct SmallWorkoutDetail: View {
    var workout : Workout
    
    var body: some View {
        ZStack{
             Color("darkest")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(workout.name)
                    .foregroundColor(.white)
                    .font(.title)
                ZStack{
//                   List {
                       ForEach(workout.exercises) { exercises in
                           SmallExerciseRow(exercise: exercises)
                        
//                    }.listRowBackground(Color("Color-3"))
                    }
                }
            }
           
        }
    }
}

struct SmallWorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        SmallWorkoutDetail(workout: workoutData[0])
    }
}
