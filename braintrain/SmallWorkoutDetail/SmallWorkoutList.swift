//
//  SmallWorkoutLIst.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/1/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct SmallWorkoutList: View {
    var workouts : [UserWorkout]
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(workouts) { workoutz in
                        
                        SmallWorkoutDetail(workout: workoutz)
                        
                   }.padding(.top,10)
                

            }
        }.frame(height: 310)
    }
    
    
}

//struct SmallWorkoutList_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallWorkoutList(workouts: workoutData)
//    }
//}
