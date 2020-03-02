//
//  ContentView.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/13/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var isNavigationBarHidden: Bool


     var body: some View {
         TabView{
                 ZStack {
                     Color("Color-10")
                     .edgesIgnoringSafeArea(.all)
                     VStack{
                         CircleImage(image: Image("healthy"))
                            Text(self.session.session?.displayName ?? "unknown")
                            .font(.custom("RobotoCondensed-Regular", size: 45))
                         .bold()
                         .foregroundColor(.black)
                        Summary(tup : workoutsLogged())
                             .padding(20)
                         WorkoutList()
                         .cornerRadius(20)
                     }.padding(.top, 20)
                         
                 }.padding(.top, 20)
                .onAppear {
                    self.isNavigationBarHidden = true
                }
                 .tabItem {
                     VStack {
                         Text("User")
                     }
                 }.tag(0)
                 
                 LogView()
                 .onAppear {
                    self.isNavigationBarHidden = true
                 }
                 .tabItem {
                     VStack {
                         Text("Log Workout")
                     }
                 }
                 .tag(1)
            
         }
        
     
       
    }
    
    func workoutsLogged() -> (Int, Int){
        var numPredicted : Int = 0
        var numLogged : Int = 0

        for workout in session.workouts {
            print(workout)
            if(workout.predicted){
                numPredicted += 1
            }
            else{
                numLogged += 1
            }
        }
        let tup = (numLogged, numPredicted)
        return tup
    }
    
    

}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environmentObject(SessionStore())
//    }
//}
