//
//  ExerciseRow.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/31/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct SmallExerciseRow: View {
    var exercise : Exercise
    
    var body: some View {
        
        ZStack{
            Color("Color-3")
            HStack {
                VStack (alignment: .leading){
                    
                    Text(self.exercise.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    HStack {
                        Text("\(self.exercise.sets) sets | ")
                           .foregroundColor(.white)
                           .font(.subheadline)
                        if(!self.exercise.timeUsed){
                            Text("\(exercise.reps) reps")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .padding(.leading, -5)
                        }
                        else{
                            Text("\(exercise.time) seconds")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.leading, -5)
                        }
                    }

                }
                Spacer()
                
            
            }.padding(.leading,30)
        }.frame(height: 60)

    }
}

struct SmallExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        SmallExerciseRow(exercise: workoutData[0].exercises[0])
//        .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
