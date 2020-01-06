//
//  ContentView.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/13/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        TabView{

            NavigationView {
                    ZStack
                        {
                            Color("Color-1")
                            .edgesIgnoringSafeArea(.all)

                            VStack{
                                
                                    CircleImage(image: Image("run"))
                                    Text(self.userData.profile.name)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    Summary(profile : self.userData.profile)
                                        .padding(.bottom,20)
                             
                                
                                WorkoutList()
                                

                            }.padding(.top, 20)
                            
                    }
            }
            .tabItem {
                VStack {
                    Text("User")
                }
            }.tag(0)
            
            LogView()
                .tabItem {
                    VStack {
                        Text("Log Workout")
                    }
                }
            .tag(1)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserData())
    }
}
