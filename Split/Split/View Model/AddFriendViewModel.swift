//
//  AddFriendViewModel.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import Foundation
import Combine

struct friendRole: Identifiable, Equatable {
  var id = UUID()
  var user: User
  var role: String
  var assignedItems: [BillItem]
  
  static func ==(lhs: friendRole, rhs: friendRole) -> Bool {
    return lhs.user.email == rhs.user.email
    }
}

class AddFriendViewModel: ObservableObject {
  @Published var addedFriends: [friendRole]
  
  init() {
    addedFriends = [friendRole]()
  }
  
  func addFriend(_ user: User, _ role: String) {
    addedFriends.append(friendRole(user: user, role: role, assignedItems: [BillItem]()))
  }
}
