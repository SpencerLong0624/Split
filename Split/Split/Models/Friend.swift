//
//  Friend.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Friend: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var active: Bool
  var user_id1: String
  var user_id2: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case active
    case user_id1
    case user_id2
  }
}
