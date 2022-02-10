//
//  FirebaseAuthenticator.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 05/10/2021.
//

import UIKit
import FirebaseAuth

class FirebaseAuthenticator: UIViewController {
    func createUser(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
    }
    func signInUser(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password)
    }
}
