//
//  MotherView.swift
//  braintrain
//
//  Created by Ria Bazaz on 2/2/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct MotherView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var session: SessionStore
    @State private var ready : Bool = false
    @State var isNavigationBarHidden: Bool = true



    var body: some View {
        NavigationView {
            VStack(alignment: .center) {

                Image("brain")
                .resizable()
                .frame(maxWidth:300, maxHeight: 250)

                Text("BrainTrain.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .padding(.top, 50)
                .padding(.bottom, 100)
                NavigationLink(destination: ContentView(isNavigationBarHidden: self.$isNavigationBarHidden), isActive: $ready){
                    Text("")
                    
                }

                NavigationLink(destination: WelcomeView(isNavigationBarHidden: self.$isNavigationBarHidden), isActive: $session.notSignedIn){
                    Text("")
                }
                
            }
            .navigationBarTitle("Hidden Title")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }

        }
        
              
        .onAppear(perform: {
            self.getUser()
        })
    }
    
    func getUser() {
        session.listen()
        ready = true
                    
    }
//    func update() {
//        print(session.session?.displayName! as Any)
//                if(session.session != nil){
//                    print("hi")
//                    loggedIn = true
//        //            self.chosen = screen.contentScreen
//                }
//                else{
//                    print("oh")
//                    loggedIn = false
//        //            self.chosen = screen.welcomeScreen
//                }
//    }
//        var exs = [Any]()
//         let ex = Exercise(name: "bicep curls", sets: 4, reps: 12, weight: 30, time: 0, timeUsed: false)
//                exs.append(ex.toAny())
//        let workout = UserWorkout(name: "Functional Lower Body", exercises: exs, date: "January 18th, 2020", predicted: false)
//        session.uploadWorkout(workout: workout)
    
}



struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
        .environmentObject(SessionStore())
    }
}
