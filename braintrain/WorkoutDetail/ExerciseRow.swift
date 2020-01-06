//
//  ExerciseRow.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/31/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct ExerciseRow: View {
    var exercise : Exercise
    var body: some View {
        
        ZStack  {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("Color-3"), lineWidth: 8)
                .frame(width: 380, height: 90)
            HStack {
                VStack (alignment: .leading) {
                    Text(self.exercise.name)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.leading, 30)
                    HStack {
                        Text("\(self.exercise.sets) sets | ")
                           .foregroundColor(.white)
                           .font(.subheadline)
                            .padding(.leading, 30)
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
                }
        }.padding(15)


    }
}

//func getMeasurement(exercise: Exercise) -> some View {
//    let measurement : Exercise.measurementType = exercise.measurementType
//    switch measurement {
//    case .reps:
//         return Text("\(exercise.reps) reps")
//            .foregroundColor(.white)
//            .font(.subheadline)
//            .padding(.leading, -5)
//        
//        
//    case .time:
//        print("Where the skies are blue")
//    }
//}

struct ExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRow(exercise: workoutData[0].exercises[0])
//        .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
