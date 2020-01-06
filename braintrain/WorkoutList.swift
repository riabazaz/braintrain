//
//  WorkoutList.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/20/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct WorkoutList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        ZStack{
            List {

                    ForEach(userData.workouts) {
                        workout in
                        NavigationLink (destination: WorkoutDetail(workout: workout)) {
                                WorkoutRow(workout: workout)
                            }.listRowBackground(Color("darkest"))
                    }
                NavigationLink (destination: WorkoutCalendar()){
                       ZStack{
                           Color("darkest")
                           HStack {
                               VStack (alignment: .leading){
                                   Text("View all")
                                   .font(.headline)
                                   .foregroundColor(.white)
                                   

                               }
                               Spacer()
                               
                           
                           }.padding(.leading,30)
                       }
                }.listRowBackground(Color("darkest"))
            }
            .padding(0)

            
        }.navigationBarTitle(Text(""))
        .navigationBarHidden(true)
           .edgesIgnoringSafeArea([.top, .bottom])

    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList()
        .environmentObject(UserData())
    }
}
