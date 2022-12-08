//
//  BillItem.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct assignedPerson {
  var personName: String
  var email: String
}

struct BillItem: Identifiable, Equatable {

  // MARK: Fields
  var id = UUID()
  var name: String
  var price: String
  var assignedPerson: assignedPerson
  
  static func ==(lhs: BillItem, rhs: BillItem) -> Bool {
    return lhs.name == rhs.name && lhs.price == rhs.price
  }
}

extension BillItem {
  var priceString: String {
    String(price)
  }
}

class BillItems : ObservableObject {
  @Published var bill_items : [BillItem]
  
  init(){
    self.bill_items = []
  }
}
