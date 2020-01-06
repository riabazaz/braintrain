//
//  WorkoutCalendar.swift
//  braintrain
//
//  Created by Ria Bazaz on 12/25/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//4

import SwiftUI

struct WorkoutCalendar: View {
    @State var deselectedIsPresented = true
    @State var dateWasSelected = false
    @State var dateWasChanged = false
    @EnvironmentObject var userData: UserData
    
    
    var rkManager4 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    
    var body: some View {
        
        ZStack{
            Color("darkest")
            VStack {
                
                RKViewController(isPresented: self.$deselectedIsPresented, rkManager: self.rkManager4, selected: self.$dateWasSelected, changed: self.$dateWasChanged)
                .environment(\.colorScheme, .dark)
                if dateWasSelected {
                    displayWorkout()
                    
                }
                if dateWasChanged {
                    displayWorkout()

                }
               

            }.onAppear(perform: startUp)

            
        }

       
        
        
    }
    func reset() {
        dateWasSelected = false
        dateWasChanged = false
    }
    func displayWorkout() -> some View {
        print(dateWasSelected)
        print(dateWasChanged)
        var current = [Workout]()
        for workout in (self.userData.workouts) {
            if(rkManager4.selectedDate != getDateFromText(string: workout.date)){
                current.append(workout)
            }
        }
        print(current.count)
        return SmallWorkoutList(workouts: current)
    }
    
   
    

    
    func startUp() {
        var min = getDateFromText(string: "October 12, 3000")
        var current = Date()
        var max = getDateFromText(string: "October 12, 1966")
        var onDates = [min,max]
        for workout in (self.userData.workouts) {
           current = getDateFromText(string: workout.date)
           if(current < min){
               min = current
           }
            if(current > max){
                max = current
            }
            onDates.append(current)
            //get array of used dates
        }
        
        self.rkManager4.updateMin(date: min)
        self.rkManager4.updateMax(date: max)
        // example of pre-setting selected dates
       

        // make list of dates between min and max, remove those in used dates
        var date = min // first date
        let endDate = max // last date

        // Formatter for printing the date, adjust it according to your needs:
        var testOffDates = [min, max]
        let fmt = DateFormatter()
        let calendar = NSCalendar.current
        fmt.dateFormat = "MMMM d, yyyy"

        while date <= endDate {
            date = calendar.date(byAdding: .day, value: 1, to: date)!
            testOffDates.append(date)
        }
        
        testOffDates = Array(Set(testOffDates).subtracting(onDates))
        rkManager4.disabledDates.append(contentsOf: testOffDates)
        
   }
    
//    func datesView(dates: RKManager) -> some View {
//       ScrollView (.horizontal) {
//           HStack {
////            if RKViewController.selected {
////           }
//       }.padding(.horizontal, 15)
//   }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "MMMM d, yyyy"
        return date == nil ? "" : formatter.string(from: date)
    }
    
    func getDateFromText(string: String!) -> Date {
        var dateString = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = .current
        dateString = formatter.date(from:string)!
        return dateString
    }
    
    
}

struct WorkoutCalendar_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCalendar()
        .environmentObject(UserData())
    }
}
