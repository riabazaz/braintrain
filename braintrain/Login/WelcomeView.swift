//
//  ContentView.swift
//  newnewnew
//
//  Created by Ria Bazaz on 10/30/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct WelcomeView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var session: SessionStore
    @Binding var isNavigationBarHidden: Bool


    var body: some View {
            VStack(alignment: .center) {
                    Text("Welcome to BrainTrain.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.top, 200)
                    .padding(.bottom, 100)
                VStack(spacing: 10){
                        NavigationLink(destination: LoginView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                            Text("Login")
                                .fontWeight(.regular)
                                .frame(minWidth: 180)
                                .padding()
                                .foregroundColor(.black)
                                .background(Color("purp"))
                                .cornerRadius(9)
                                .shadow(color: .gray, radius: 10.0)
                        }
                        
                        NavigationLink(destination: CreateView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                           Text("Create Account")
                               .fontWeight(.regular)
                               .frame(minWidth: 180)
                                .padding()
                              .foregroundColor(.black)
                              .background(Color.white)
                              .cornerRadius(9)
                           .shadow(color: .gray, radius: 10.0)
                        }
                }
            }
        //        .onAppear(perform: getUser)
    }
//    func getUser () {
//        session.listen()
//        if(session.session != nil){
//
//        }
//        var exs = [Any]()
//         let ex = Exercise(name: "bicep curls", sets: 4, reps: 12, weight: 30, time: 0, timeUsed: false)
//                exs.append(ex.toAny())
//        let workout = UserWorkout(name: "Functional Lower Body", exercises: exs, date: "January 18th, 2020", predicted: false)
//        session.uploadWorkout(workout: workout)
    
//    }
}


//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//        .environmentObject(SessionStore())
//    }
//}
