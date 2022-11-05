//
//  UserItem.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct UserItem: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var item_id: String
  var user_id: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case item_id
    case user_id
  }
}
