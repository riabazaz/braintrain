//
//  WorkoutRow.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/20/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct WorkoutRow: View {
    var workout : UserWorkout
    
    var body: some View {
        
       ZStack  {

                RoundedRectangle(cornerRadius: 5)
                    .fill(getType(workoutname: self.workout.name))
                    .frame(width: 340, height: 90)
                Rectangle()
                    .fill(getTypeOverlay(workoutname: self.workout.name))
                    .frame(width:5, height: 90)
                    .padding(.trailing, 337)
                    .cornerRadius(5)
                HStack {
                        VStack (alignment: .leading){
                            
                            Text(self.workout.name)
                            .font(.custom("RobotoCondensed-Regular", size: 20))
                            .foregroundColor(.black)
                            Text(self.workout.date)
                            .font(.custom("RobotoCondensed-Regular", size: 15))
                            .foregroundColor(.black)

                        }
                        Spacer()
                        
                    
                    }.padding(.leading,70)
                }

            }
            
            func getType(workoutname: String) -> Color {
                if(workoutname.contains("Lower Body")){
                    return Color("Color-6")
                }
                return Color("Color-8")
            }
            func getTypeOverlay(workoutname: String) -> Color {
                if(workoutname.contains("Upper Body")){
                    return Color("Color-7")
                }
                return(Color("Color"))

            }
            
        }

//struct WorkoutRow_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutRow(workout: workoutData[0])
////        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
