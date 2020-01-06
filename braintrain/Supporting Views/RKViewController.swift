//
//  RKViewController.swift
//  RKCalendar
//
//  Created by Raffi Kian on 7/14/19.
//  Copyright © 2019 Raffi Kian. All rights reserved.
//

import SwiftUI

struct RKViewController: View {
    @EnvironmentObject var userData: UserData
    @Binding var isPresented: Bool
    @ObservedObject var rkManager: RKManager
    @Binding var selected: Bool
    @Binding var changed: Bool

    var body: some View {
        Group {
            RKWeekdayHeader(rkManager: self.rkManager)
            Divider()
            List {
                ForEach(0..<numberOfMonths()) { index in
                    RKMonth(isPresented: self.$isPresented,
                            rkManager: self.rkManager, selected: self.$selected, changed: self.$changed, monthOffset: index)
                    
                }
                Divider()
            }
        }
    }
    
    
    func numberOfMonths() -> Int {
        return rkManager.calendar.dateComponents([.month], from: rkManager.minimumDate, to: RKMaximumDateMonthLastDay()).month! + 1
    }
    
    func RKMaximumDateMonthLastDay() -> Date {
        var components = rkManager.calendar.dateComponents([.year, .month, .day], from: rkManager.maximumDate)
        components.month! += 1
        components.day = 0
        
        return rkManager.calendar.date(from: components)!
    }
}

#if DEBUG
struct RKViewController_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RKViewController(isPresented: .constant(false), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), selected: .constant(false), changed: .constant(false))
            .environmentObject(UserData())

            RKViewController(isPresented: .constant(false),  rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*32), mode: 0), selected: .constant(false), changed: .constant(false))
                .environment(\.colorScheme, .dark)
                .environment(\.layoutDirection, .rightToLeft)
            .environmentObject(UserData())

        }
    }
}
#endif

