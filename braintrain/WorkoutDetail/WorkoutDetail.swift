//
//  WorkoutDetail.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/22/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct WorkoutDetail: View {
    var workout : UserWorkout
    
    var body: some View {
        ZStack{
             Color("darkest")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(workout.name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(workout.date)
                   .foregroundColor(.white)
                   .font(.title)
                   .multilineTextAlignment(.center)

                ForEach(workout.exercises as! [Exercise]) {
                                       exercises in
                    ExerciseRow(exercise: exercises)

                }
            }

           
        }
        .navigationBarTitle(Text("discipline"), displayMode: .inline)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)


    }
//    mutating func cast(){
//        for exercise in workout.exercises{
//            exercises.append(exercise as! Exercise)
//        }
//    }
}

//struct WorkoutDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutDetail(workout: workoutData[0])
////        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
