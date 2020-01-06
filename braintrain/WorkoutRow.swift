//
//  WorkoutRow.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/20/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct WorkoutRow: View {
    var workout : Workout
    
    var body: some View {
        
        ZStack{
            Color("darkest")
            HStack {
                VStack (alignment: .leading){
                    
                    Text(self.workout.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    Text(self.workout.date)
                    .font(.subheadline)
                    .foregroundColor(.white)

                }
                Spacer()
                
            
            }.padding(.leading,30)
        }

    }
}

struct WorkoutRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRow(workout: workoutData[0])
//        .previewLayout(.fixed(width: 300, height: 70))
    }
}
