//
//  LogPopover.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/19/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//


import SwiftUI

struct LogPopover: View {
    var exercise : DatabaseExercise
    @State private var reps: Int
    var body: some View {
        
        ZStack{
            VStack (alignment: .leading){
            
                Text("\(self.exercise.name ?? "unknown")")
                    .font(.title)
                    .bold()
                Stepper("Reps", value: $reps, in: 0...130)

                
            }
                
            
        }
    

    }
}

//struct LogPopover_Previews: PreviewProvider {
//    static var previews: some View {
//        LogPopover(exercise: DatabaseExercise())
////        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
