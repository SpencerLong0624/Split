//
//  BillItem.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct BillItem: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var bill_id: String
  var name: String
  var price: Int
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case bill_id
    case name
    case price
  }
}

extension BillItem {
    var priceString: String {
        String(price)
    }
}
