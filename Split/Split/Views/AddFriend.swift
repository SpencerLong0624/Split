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
  
  var body: some View {
    VStack {
      Form {
        Section(header: Text(" My Friends")) {
          ForEach(user.friends.sorted()) {
            friend in AddFriendRowView(friend: usersViewModel.getUser(email: friend)[0].user, addFriendViewModel: addFriendViewModel)
          }
        }
      }
    }
  }
}
