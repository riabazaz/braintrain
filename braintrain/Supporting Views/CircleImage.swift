//
//  CircleImage.swift
//  braintrain
//
//  Created by Ria Bazaz on 11/13/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .frame(width:180, height: 180)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color("darkest"), lineWidth: 4).frame(width:180, height: 180))
            .shadow(radius: 10)
        
            

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("run"))
    }
}
