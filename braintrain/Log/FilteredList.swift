//
//  Select.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/5/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<Content:View>: View {
    var fetchRequest: FetchRequest<DatabaseExercise>
    var exercises: FetchedResults<DatabaseExercise>
    { fetchRequest.wrappedValue }
//    let preds : nscom
    let content: (DatabaseExercise) -> Content
    @State var searchTerm : String = ""

//    @FetchRequest(entity: DatabaseExercise.entity(),
//   sortDescriptors: [
//       NSSortDescriptor(keyPath: \DatabaseExercise.name, ascending: true)
//   ]) var exercises: FetchedResults<DatabaseExercise>
//    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body : some View {
        VStack {
            SearchBar(text: $searchTerm)
            List(containsFilter(exercises: exercises, filter: self.searchTerm), id: \.self) { exercise in
                self.content(exercise)
            }
        }
    }
    func containsFilter(exercises: FetchedResults<DatabaseExercise>, filter : String) -> [DatabaseExercise] {
        var filtered = [DatabaseExercise]()
        if(filter == ""){
            for exercise in exercises {
                filtered.append(exercise)
            }
            return filtered
        }
        for exercise in exercises {
            if(exercise.name?.localizedStandardContains(filter) ?? false){
                filtered.append(exercise)
            }
        }
        return filtered
    }
    

    private var groups : [MuscleGroup] = [MuscleGroup(name: "abdominals"), MuscleGroup(name: "abductors"), MuscleGroup(name: "adductors"), MuscleGroup(name: "biceps"),
                              MuscleGroup(name: "calves"), MuscleGroup(name: "chest"), MuscleGroup(name: "forearms"), MuscleGroup(name: "glutes"), MuscleGroup(name: "hamstrings"), MuscleGroup(name: "lats"),
    MuscleGroup(name: "back"), MuscleGroup(name: "quads"), MuscleGroup(name: "shoulders"), MuscleGroup(name: "triceps")]
    
    init(muscles : [MuscleGroup], @ViewBuilder content: @escaping (DatabaseExercise) -> Content) {
        var conditions = [NSPredicate]()
        for item in muscles {
            if(item.name == "back"){
                conditions.append(NSPredicate(format: "muscle == %@", "lower back"))
                conditions.append(NSPredicate(format: "muscle == %@", "middle back"))
                conditions.append(NSPredicate(format: "muscle == %@", "lats"))
            }
            else if(item.name == "quads"){
                conditions.append(NSPredicate(format: "muscle == %@", "quadriceps"))
            }
            else if(item.name == "shoulders"){
                conditions.append(NSPredicate(format: "muscle == %@", "traps"))
                conditions.append(NSPredicate(format: "muscle == %@", "shoulders"))
            }
            else{
                conditions.append(NSPredicate(format: "muscle == %@", item.name))
            }
            print(item.name)
        }
        let andPredicate = NSCompoundPredicate(type: .or, subpredicates: conditions)
        print(andPredicate)
        self.fetchRequest = FetchRequest<DatabaseExercise>(entity: DatabaseExercise.entity(),
           sortDescriptors: [NSSortDescriptor(keyPath: \DatabaseExercise.name, ascending: true)]
            , predicate: andPredicate)
        self.content = content



        
    }
    
    
}
//
//struct Select_Previews: PreviewProvider {
//    static var previews: some View {
//        Select(muscles: [MuscleGroup(name: "abdominals"), MuscleGroup(name: "abductors"), MuscleGroup(name: "adductors")])
//
//    }
//}

