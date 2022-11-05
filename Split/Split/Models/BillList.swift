//
//  BillList.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct BillList: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var bills: [String]
  var user_id: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case bills
    case user_id
  }
}
