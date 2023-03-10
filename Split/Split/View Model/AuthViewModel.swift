//
//  AuthViewModel.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/29/22.
//



import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
  var user: FirebaseAuth.User? {
    didSet {
      objectWillChange.send()
    }
  }
    
  func listenToAuthState() {
    Auth.auth().addStateDidChangeListener { [weak self] _, user in
      guard let self = self else {
        return
      }
      self.user = user
    }
  }
   
  func loginUser(emailAddress: String, password: String) {
    Auth.auth().signIn(withEmail: emailAddress, password: password) { result, err in
      if let err = err {
        print("Failed due to error:", err)
        return
      }
      print("Successfully logged in with ID: \(result?.user.uid ?? "")")
    }
  }
    
  func signUp(emailAddress: String, password: String) {
    Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
      if let error = error {
        print("an error occured: \(error.localizedDescription)")
        return
      }
    }
  }
   
  func addUserToFirebase(emailAddress: String, full_name: String, phone_number: String) {
     let friends : [String] = []
     let user : User = User( balance_owed: 0, balance_owed_to: 0, email: emailAddress, friends: friends, full_name: full_name, phone_number: phone_number)
     @ObservedObject var userViewModel = UserViewModel(user: user)
     userViewModel.add(user)
   }
    
  func signOut() {
    do {
      try Auth.auth().signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
}
