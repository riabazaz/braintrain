//
//  SessionStore.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/25/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth
import Combine

class SessionStore : ObservableObject {
    @Published var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? { didSet { self.didChange.send(self) }}
    @Published var handle: AuthStateDidChangeListenerHandle?
    @Published var workouts: [UserWorkout] = []
    @Published var signedIn : Bool = false
    @Published var notSignedIn : Bool = false

    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")
    
   
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
            } else {
                self.notSignedIn = true
                self.session = nil
            }
        }
        getWorkouts()
        self.signedIn = true

    }
    
    func signUp(
        email: String,
        password: String,
        displayName: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayName
        changeRequest?.commitChanges { (error) in
        }
    }

    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        
    }

    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func getWorkouts() {
        ref.observe(DataEventType.value) { (snapshot) in
            self.workouts = []
            for child in snapshot.children {
                print(child)
                if let snapshot = child as? DataSnapshot,
                    let workout = UserWorkout(snapshot: snapshot) {
                    self.workouts.append(workout)
                }
            }
        }
    }
    
    
    func uploadWorkout(workout: UserWorkout) {
        //Generates number going up as time goes on, sets order of TODO's by how old they are.
        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
        print(ref)
        let postRef = ref.child(String(number))
        print(postRef)
        postRef.setValue(workout.toAny())
    }
    
    
    func updateWorkouts(key: String, name: String, date: String, exercises : [Exercise]) {
        let update = ["name": name, "date": date, "exercises" : exercises] as [String : Any]
        let childUpdate = ["\(key)": update]
        ref.updateChildValues(childUpdate)
    }

}
