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
  @State var allUsers : [User] = []
  
  var body: some View {
    VStack {
      Form {
        Section(header: Text("My Friends")) {
          if addFriendViewModel.addedFriends.count == allUsers.count {
            Text("All friends have been added.")
          } else {
            ForEach(allUsers) {
              friend in AddFriendRowView(friend: friend, addFriendViewModel: addFriendViewModel)
            }
          }
        }
      }
    }
    .onAppear(perform: loadData)
  }
  
  func loadData() {
    var all_user_emails : [String] = user.friends
    all_user_emails.append(user.email)
    let final_user_emails : [String] = all_user_emails.sorted()
    for curr_user in final_user_emails {
      self.allUsers.append(usersViewModel.getUser(email: curr_user)[0].user)
    }
  }
}
