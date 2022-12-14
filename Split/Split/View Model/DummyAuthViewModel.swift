//
//  DummyAuthViewModel.swift
//  Split
//
//  Created by Anthony A Lees on 12/13/22.
//

import SwiftUI
import FirebaseAuth

final class DummyAuthViewModel: ObservableObject {
  var user: FirebaseAuth.User? {
    didSet {
      objectWillChange.send()
    }
  }
  
  init () {
    listenToAuthState()
  }
  
  func listenToAuthState() {
    Auth.auth().addStateDidChangeListener { [weak self] _, user in
      guard let self = self else {
        return
      }
      self.user = user
    }
  }
}
