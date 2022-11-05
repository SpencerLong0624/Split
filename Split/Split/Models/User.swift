//
//  User.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var balance_owed: Int
  var balance_owed_to: Int
  var email: String
  var full_name: String
  var password: String
  var phone_number: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case balance_owed
    case balance_owed_to
    case email
    case full_name
    case password
    case phone_number
  }
}
