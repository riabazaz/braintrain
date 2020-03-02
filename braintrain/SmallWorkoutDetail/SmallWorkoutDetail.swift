//
//  SmallWorkoutDetail.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/31/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct SmallWorkoutDetail: View {
    var workout : UserWorkout
    var exercises = [Exercise]()
    func cast()  {
        _ = exercises as [Exercise]
        
    }
    var body: some View {
        ZStack{
             Color("darkest")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(workout.name)
                    .foregroundColor(.white)
                    .font(.title)
                ZStack{
                    ForEach(self.exercises) { exercise in
                        SmallExerciseRow(exercise: exercise as Exercise)

                    }
                }
            }
           
        }.onAppear {
            self.cast()
        }
    }
        
        
//    func toExercise(any: AnyObject) -> Exercise {
//        if let any = Exercise(as? E
//       return Exercise(name: any.name, sets:  any.sets, reps: any.reps, weight: (any as AnyObject).weight, time: any.time, timeUsed: any.timeUsed)
//    }
}

//struct SmallWorkoutDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallWorkoutDetail(workout: workoutData[0])
//    }
//}
