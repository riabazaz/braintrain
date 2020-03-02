//
//  Summary.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/18/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct Summary: View {
    @EnvironmentObject var session: SessionStore
    var tup : (logged: Int, predicted: Int)

    var body: some View {
        
            
            HStack (alignment: .center, spacing: 25){
                VStack {
                    Text(String(tup.logged))
                       .font(.custom("RobotoCondensed-Regular", size: 30))
                        .foregroundColor(.black)
                    Text("workouts \nlogged")
                        .font(.custom("RobotoCondensed-Regular", size: 18))
                        .foregroundColor(Color("Color-1"))
                }
                VStack{
                    Text(String(tup.predicted))
                       .font(.custom("RobotoCondensed-Regular", size: 30))
                        .foregroundColor(.black)
                    Text("workouts \npredicted")
                        .font(.custom("RobotoCondensed-Regular", size: 18))
                        .foregroundColor(Color("Color-1"))
                }
                

            }
        
    }
    
    
}

//struct Summary_Previews: PreviewProvider {
//    static var previews: some View {
//        Summary()
//        .environmentObject(SessionStore())
//    }
//}

