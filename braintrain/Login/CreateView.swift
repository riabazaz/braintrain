//
//  CreateView.swift
//  newnewnew
//
//  Created by Ria Bazaz on 11/1/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//

import SwiftUI

struct CreateView: View {
    @EnvironmentObject var session: SessionStore
    @Binding var isNavigationBarHidden: Bool

    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""

    var body: some View {
        NavigationView{
            
            VStack (alignment: .leading){
                
               Text("Create Account")
                  .font(.largeTitle)
                  .fontWeight(.semibold)
                  .foregroundColor(Color.black)
                  .padding(20)
                VStack (alignment: .leading, spacing: 0){
                    TextField("Name", text: $name)
                        .padding()
                      Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(Color("purp"))
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, 15)
                    TextField("Email", text: $email)
                      .padding()
                    Rectangle()
                      .frame(height: 1.0, alignment: .bottom)
                      .foregroundColor(Color("purp"))
                        .padding(.leading)
                      .padding(.trailing)
                      .padding(.bottom, 15)
                    SecureField("Password", text: $password)
                        .padding()
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(Color("purp"))
                        .padding(.leading)
                        .padding(.trailing)
                }
                NavigationLink(destination: ContentView(isNavigationBarHidden: self.$isNavigationBarHidden), isActive: $session.signedIn) {
                    Button(action: {
                        print("login tapped")
                        self.signUp()
                        
                    }) {
                        Text("Get Started")
                            .fontWeight(.regular)
                            .frame(minWidth: 180)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("purp"))
                            .cornerRadius(9)
                            .shadow(color: .gray, radius: 10.0)
                            .padding(.leading, 100)
                            .padding(.top, 100)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    }
                }
                
            }.background(
                Image("overlay2")
                    .padding(.top, -120))
            
            }


    
    }
        
    func signUp () {
        if !email.isEmpty && !password.isEmpty {
            session.signUp(email: email, password: password, displayName: name) { (result, error) in
                    if error != nil {
                        print("Error")
                    } else {
                        self.email = ""
                        self.password = ""
                    }
                }
            }
        }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateView()
//    }
//}
