//
//  Bill.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import Foundation
import FirebaseFirestoreSwift

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

struct Bill: Identifiable, Comparable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var bill_owers: [String]
  var bill_payers: [String]
  var date: String
  var description: String
  var title: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case bill_owers
    case bill_payers
    case date
    case description
    case title
  }
  
  // MARK: Comparable
  static func ==(lhs: Bill, rhs: Bill) -> Bool {
    return lhs.title == rhs.title && lhs.description == rhs.description && lhs.date == rhs.date
  }
  
  static func <(lhs: Bill, rhs: Bill) -> Bool {
    if Int(lhs.date[0...2])! < Int(rhs.date[0...2])! {
      return true
    } else if Int(lhs.date[0...2]) == Int(rhs.date[0...2]) {
      if Int(lhs.date[3...5])! < Int(rhs.date[3...5])! {
        return true
      } else if Int(lhs.date[3...5]) == Int(rhs.date[3...5]) {
        if Int(lhs.date[6...8])! < Int(rhs.date[3...8])! {
          return false
        } else {
          return false
        }
      } else {
        return false
      }
    } else {
      return false
    }
  }
}
