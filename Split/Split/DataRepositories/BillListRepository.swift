//
//  BillListRepository.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class BillListRepository: ObservableObject {
  private let path: String = "bill_lists"
  private let store = Firestore.firestore()
  
  @Published var bill_lists: [BillList] = []
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

        self.bill_lists = querySnapshot?.documents.compactMap { document in
          try? document.data(as: BillList.self)
        } ?? []
      }
  }
}
