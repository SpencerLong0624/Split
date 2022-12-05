//
//  BillRepository.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class BillRepository: ObservableObject {
  private let path: String = "bills"
  private let store = Firestore.firestore()
  
  @Published var bills: [Bill] = []
  private var cancellables: Set<AnyCancellable> = []
  
  init() {
    self.get()
  }
  
  func get() {
    store.collection(path)
    .addSnapshotListener { querySnapshot, error in
      if let error = error {
        print("Error getting bills: \(error.localizedDescription)")
        return
      }

      self.bills = querySnapshot?.documents.compactMap { document in
        try? document.data(as: Bill.self)
      } ?? []
    }
  }
  
  // MARK: CRUD methods
  func add(_ bill: Bill) {
    do {
      let newBill = bill
      _ = try store.collection(path).addDocument(from: newBill)
    } catch {
      fatalError("Unable to add bill: \(error.localizedDescription).")
    }
  }

  func update(_ bill: Bill) {
    guard let billId = bill.id else { return }
    
    do {
      try store.collection(path).document(billId).setData(from: bill)
    } catch {
      fatalError("Unable to update bill: \(error.localizedDescription).")
    }
  }

  func remove(_ bill: Bill) {
    guard let billId = bill.id else { return }
    
    store.collection(path).document(billId).delete { error in
      if let error = error {
        print("Unable to remove bill: \(error.localizedDescription)")
      }
    }
  }
}
