//
//  Select.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/5/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI
import CoreData

struct Select: View {
    @FetchRequest(entity: DatabaseExercise.entity(),
       sortDescriptors: [
           NSSortDescriptor(keyPath: \DatabaseExercise.name, ascending: true)
       ]) var exercises: FetchedResults<DatabaseExercise>
    
       @Environment(\.managedObjectContext) var managedObjectContext
    @State var selectedmuscles = [MuscleGroup]()

    //                ForEach(exercises, id: \.self) { exercise in
       //                    Text(exercise.muscle ?? "Unknown")
       //                }
    var body : some View {
        ZStack{
             Color("darkest")
                .edgesIgnoringSafeArea(.all)

        }
    }
    
    func getFetched() -> String {
        let controller = NSFetchedResultsController(fetchRequest: FetchedResults, managedObjectContext: managedObjectContext, sectionNameKeyPath: <#T##String?#>, cacheName: <#T##String?#>)
    }
}

struct Select_Previews: PreviewProvider {
    static var previews: some View {
        Select()
    }
}
