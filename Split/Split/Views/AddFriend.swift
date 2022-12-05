//
//  AddFriend.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import SwiftUI

struct AddFriend: View {
  @State private var dummyFriends: [Friend] = [
    Friend(active: true, user_id1: "me", user_id2: "Anthony"),
    Friend(active: true, user_id1: "me", user_id2: "Uzair")
  ]
  
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
    var body: some View {
      VStack {
        Form {
          Section(header: Text(" My Friends")) {
            ForEach(dummyFriends) {
              friend in AddFriendRowView(friend: friend, addFriendViewModel: addFriendViewModel)
            }
          }
        }
      }
    }
}
