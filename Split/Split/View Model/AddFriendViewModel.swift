//
//  AddFriendViewModel.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import Foundation
import Combine

struct friendRole: Identifiable {
  var id = UUID()
  var user: User
  var role: String
  var assignedItems: [BillItems]
}

class AddFriendViewModel: ObservableObject {
  @Published var addedFriends: [friendRole]
  
  init() {
    addedFriends = [friendRole]()
  }
  
  func addFriend(_ user: User, _ role: String) {
    addedFriends.append(friendRole(user: user, role: role, assignedItems: [BillItems]()))
  }
}
