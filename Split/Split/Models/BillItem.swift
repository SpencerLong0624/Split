//
//  BillItem.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct BillItem: Identifiable {

  // MARK: Fields
  var id = UUID()
  var name: String
  var price: String
  
}

extension BillItem {
    var priceString: String {
        String(price)
    }
}

class BillItems : ObservableObject {
  @Published var bill_items : [BillItem]
  
  init(){
          self.bill_items = [
            BillItem(name: "milk", price: "1.00"),
            BillItem(name: "cheese", price: "2.00"),
            BillItem(name: "rice", price: "3.00")]
      }
}
