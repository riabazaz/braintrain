//
//  SwiftUIView.swift
//  newnewnew
//
//  Created by Ria Bazaz on 11/1/19.
//  Copyright © 2019 Ria Bazaz. All rights reserved.
//
import Firebase
import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    @EnvironmentObject var session: SessionStore
    @Binding var isNavigationBarHidden: Bool

    
    var body: some View {
            VStack (alignment: .leading){
               Text("Login")
                  .font(.largeTitle)
                  .fontWeight(.semibold)
                  .foregroundColor(Color.black)
                  .padding(20)
                .padding(.bottom, 20)
                VStack (alignment: .leading, spacing: 0){
                    TextField("Email", text: $email)
                        .padding()
                        .autocapitalization(.none)
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
                        self.signIn()
                        
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
                    }
                   
                   
                }
                
            }.background(Image("overlay2")
                    .padding(.top, -120))
                   
    }


    func signIn () {
         
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                print("not logged in")
                self.error = true
            } else {
                print("logged in")
                self.session.signedIn = true
                self.email = ""
                self.password = ""
            }
        }


    }


   
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView().environmentObject(SessionStore())
//    }
//}
//
