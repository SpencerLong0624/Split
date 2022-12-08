//
//  BillItem.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

//struct assignedPerson: Identifiable {
//  var id = UUID()
//  var personName: String
//  var email: String
//}

//class BillItem: Identifiable, Equatable, ObservableObject {
struct BillItem: Identifiable, Equatable {

  // MARK: Fields
  var id = UUID()
  var email: String
  var name: String
  var price: String
  var user_full_name: String
//  @Published var assignedPerson: assignedPerson
//
//  init(name: String, price: String) {
//    self.name = name
//    self.price = price
//    self.assignedPerson = assignedPerson(personName: "", email: "")
//  }
  
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
