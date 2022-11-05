//
//  SettleBillRepository.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class SettleBillRepository: ObservableObject {
  private let path: String = "settle_bills"
  private let store = Firestore.firestore()
  
  @Published var settle_bills: [SettleBill] = []
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

        self.settle_bills = querySnapshot?.documents.compactMap { document in
          try? document.data(as: SettleBill.self)
        } ?? []
      }
  }
}
