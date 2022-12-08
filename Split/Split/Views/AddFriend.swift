//
//  AddFriend.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import SwiftUI

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct AddFriend: View {

  @ObservedObject var addFriendViewModel: AddFriendViewModel
  @State var user : User
  @ObservedObject var usersViewModel = UsersViewModel()
  @State var allUsers : [String] = []
  
  func addCurrUser(curr_friends : [String]) -> [String] {
    var res : [String] = curr_friends
    res.append(user.email)
    return res
  }
  
  var body: some View {
    VStack {
      Form {
        Section(header: Text("My Friends")) {
          ForEach(addCurrUser(curr_friends: user.friends).sorted()) {
            friend in AddFriendRowView(friend: usersViewModel.getUser(email: friend)[0].user, addFriendViewModel: addFriendViewModel)
          }
        }
      }
    }
  }
}
