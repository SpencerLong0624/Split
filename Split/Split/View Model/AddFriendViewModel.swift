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
  var friend: Friend
  var role: String
}


class AddFriendViewModel: ObservableObject {
  @Published var addedFriends: [friendRole]
  
  init() {
    addedFriends = []
  }
  
  func addFriend(_ friend: Friend, _ role: String) {
    addedFriends.append(friendRole(friend: friend, role: role))
  }
}
