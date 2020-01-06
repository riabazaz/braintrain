//
//  Summary.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/18/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct Summary: View {
    var profile : Profile
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 5, style: .continuous)
            .fill(Color("darkest"))
            .frame(width: 350, height: 90)
            
            HStack {
                
                Text("\(self.profile.workoutslogged)")
                    .font(.title)            .foregroundColor(.white)
                Text("workouts \nlogged")
                    .font(.headline)
                .foregroundColor(Color("Color-1"))
                Text("\(self.profile.workoutspredicted)")
                    .font(.title)            .foregroundColor(.white)
                Text("workouts \npredicted")
                    .font(.headline)
                .foregroundColor(Color("Color-1"))
                

            }
        }
        
       
    }
}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary(profile : profileData[0])
    }
}

