//
//  UserItemRepository.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserItemRepository: ObservableObject {
  private let path: String = "user_items"
  private let store = Firestore.firestore()
  
  @Published var user_items: [UserItem] = []
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

        self.user_items = querySnapshot?.documents.compactMap { document in
          try? document.data(as: UserItem.self)
        } ?? []
      }
  }
}
