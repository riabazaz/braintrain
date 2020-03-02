//
//  User.swift
//  braintrain
//
//  Created by Ria Bazaz on 1/25/20.
//  Copyright © 2020 Ria Bazaz. All rights reserved.
//

class User {
    var uid: String
    var email: String?
    var displayName: String?



    init(uid: String, displayName : String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName


    }
//    func setPhoto() {
//        let photoURL = self.photoURL
//    }

}
