//
//  FriendRepository.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class FriendRepository: ObservableObject {
  private let path: String = "friends"
  private let store = Firestore.firestore()
  
  @Published var friends: [Friend] = []
  private var cancellables: Set<AnyCancellable> = []
  
  init() {
    self.get()
  }
  
  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting books: \(error.localizedDescription)")
          return
        }

        self.friends = querySnapshot?.documents.compactMap { document in
          try? document.data(as: Friend.self)
        } ?? []
      }
  }
}
