//
//  WorkoutList.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/20/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct WorkoutList: View {
//    @EnvironmentObject private var userData: UserData
    @EnvironmentObject var session: SessionStore

    var body: some View {
        
        ScrollView{
            ZStack{
                Color(.white)
                VStack{
                    Text("Previous Workouts")
                    .font(.custom("RobotoCondensed-Regular", size: 30))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.trailing, 105)
                    ForEach(session.workouts) {
                        workout in
                        NavigationLink (destination: WorkoutDetail(workout: workout)) {
                            WorkoutRow(workout: workout)
                            .shadow(radius: 2)
                            .padding(7)
                            .navigationBarHidden(false)
                        }
                    }
                    NavigationLink (destination: WorkoutCalendar()){
                       ZStack  {
                           RoundedRectangle(cornerRadius: 5)
                               .fill(Color("Color-8"))
                               .frame(width: 340, height: 90)
                           Rectangle()
                               .fill(Color("Color-7"))
                               .frame(width:5, height: 90)
                               .padding(.trailing, 337)
                               .cornerRadius(5)
                           HStack {
                                   VStack (alignment: .leading){
                                       Text("View All")
                                       .font(.custom("RobotoCondensed-Regular", size: 20))
                                       .foregroundColor(.black)
                                   }
                                   Spacer()
                               }.padding(.leading,70)
                        }
                    }
                }
                .padding(.bottom, 120)
            }
        }
        .frame(minHeight: 500)
        .navigationBarTitle(Text(""))
        
    }
}

//struct WorkoutList_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutList()
//        .environmentObject(UserData())
//    }
//}
