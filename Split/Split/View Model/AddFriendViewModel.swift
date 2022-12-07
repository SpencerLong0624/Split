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
  var name: String
  var email: String
  var role: String
  var assignedItems: [BillItems]
}

class AddFriendViewModel: ObservableObject {
  @Published var addedFriends: [friendRole]
  
  init() {
    addedFriends = [friendRole]()
  }
  
  func addFriend(_ name: String, _ email: String, _ role: String) {
    addedFriends.append(friendRole(name: name, email: email, role: role, assignedItems: [BillItems]()))
  }
}
