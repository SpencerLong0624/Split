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
//  @Published var addedFriends: [Friend]
//  @Published var friendRoles: [String]
  @Published var addedFriends: [friendRole]
  
  init() {
//    addedFriends = [Friend]()
//    friendRoles = [String]()
//    addedFriends = [friendRole]()
    addedFriends = [
//      friendRole(friend: Friend(active: true, user_id1: "me", user_id2: "Anthony"), role: "Ower"),
//      friendRole(friend: Friend(active: true, user_id1: "me", user_id2: "Uzair"), role: "Bill Payer")
    ]
  }
  
  func addFriend(_ friend: Friend, _ role: String) {
//    addedFriends.append(friend)
//    friendRoles.append(role)
    addedFriends.append(friendRole(friend: friend, role: role))
  }
  
}
