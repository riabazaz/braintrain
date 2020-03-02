//
//  MultiSelectRow.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/16/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//
import Foundation
import SwiftUI

struct MultiSelectRow : View {
    
    var exercise : DatabaseExercise
    @Binding var selectedItems: Set<UUID>
    @State private var isSelected: Bool = false
//    {
//        selectedItems.contains(exercise.id ?? UUID())
//    }
    
    var body: some View {
        HStack{
            Button(action: {
                if self.isSelected {
                    self.selectedItems.remove(self.exercise.id ?? UUID())
                    self.isSelected = false

                } else {
                    self.selectedItems.insert(self.exercise.id ?? UUID())
                    self.isSelected = true
                }
            }) { HStack {
                    Text("\(self.exercise.name ?? "unknown")")
                    Spacer()
                    
                }
            }.sheet(
                isPresented: self.$isSelected
//                arrowEdge: .bottom
            ) {
                Text("Hi")
            }
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)

        
        
    }

    
}
