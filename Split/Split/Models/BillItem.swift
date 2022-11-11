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
          self.bill_items = []
      }
}
