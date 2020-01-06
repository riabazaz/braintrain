//
//  Log.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/1/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI
import CoreData


struct LogView: View {
   
    private var groups : [MuscleGroup] = [MuscleGroup(name: "abdominals"), MuscleGroup(name: "abductors"), MuscleGroup(name: "adductors"), MuscleGroup(name: "biceps"),
                              MuscleGroup(name: "calves"), MuscleGroup(name: "chest"), MuscleGroup(name: "forearms"), MuscleGroup(name: "glutes"), MuscleGroup(name: "hamstrings"), MuscleGroup(name: "lats"),
    MuscleGroup(name: "back"), MuscleGroup(name: "quads"), MuscleGroup(name: "shoulders"), MuscleGroup(name: "triceps")]
    @State  var selectedmuscles = [MuscleGroup]()

    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
   
                    Text("Select muscle groups trained")
                        .font(.title)
                    ForEach(groups){ muscle in
                        Button(action: {
                            self.addToSelected(muscle: muscle)
                            
                        }){
                            HStack {
                                Text(muscle.name)
                            }
                             .padding()
                            .foregroundColor(self.textColor(muscle: muscle))
                            .background(self.buttonColor(muscle: muscle))
                            .cornerRadius(40)
                            .frame(minWidth: 400)
//                            .cornerRadius(20)

                        }
                        .padding()


                    }
                    
                }
                .padding(.top, -30)
                .navigationBarItems(trailing:
                    NavigationLink(destination: Select(selectedmuscles: selectedmuscles)) {
                        
                        Text("Next")
                    }
                )
            }
            
        }
        
    }
    
    func addToSelected(muscle: MuscleGroup) {
        if(selectedmuscles.contains(muscle)){
            return
        }
        selectedmuscles.append(muscle)
    }
    

    func buttonColor(muscle : MuscleGroup) -> Color {
        if(selectedmuscles.contains(muscle)){
            return Color("Color-3")
        }
        return .gray
    
    }
   
    func textColor(muscle:  MuscleGroup) -> Color {
        if(selectedmuscles.contains(muscle)){
            return .white
        }
        return .white
    
    }
    
}

#if DEBUG
struct LogView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LogView()
//            .environmentObject(UserData())

    
        }
    }
}
#endif

