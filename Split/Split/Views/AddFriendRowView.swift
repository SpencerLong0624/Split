//
//  AddFriendRowView.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import SwiftUI

struct AddFriendRowView: View {
  var friend: Friend
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  func addBillPayer() {
    addFriendViewModel.addFriend(friend, "Bill Payer")
  }
  
  func addOwer() {
    addFriendViewModel.addFriend(friend, "Ower")
  }
  
  var body: some View {
    if !addFriendViewModel.addedFriends.contains(where: { $0.friend.user_id2 == friend.user_id2 }) {
      HStack(spacing: 0) {
        Text("\(friend.user_id2)")
          .frame(maxWidth: .infinity, alignment: .leading)
        Button("Bill Payer", action: addBillPayer)
          .buttonStyle(BorderlessButtonStyle())
          .padding()
          .clipShape(Capsule())
          .background(.green)
          .tint(.white)
          .cornerRadius(6)
          .frame(maxWidth: .infinity, alignment: .center)
        Button("Ower", action: addOwer)
          .buttonStyle(BorderlessButtonStyle())
          .padding()
          .clipShape(Capsule())
          .background(.red)
          .tint(.white)
          .cornerRadius(6)
          .frame(maxWidth: .infinity, alignment: .trailing)
      }
    }
  }
}
