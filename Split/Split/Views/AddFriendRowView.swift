//
//  AddFriendRowView.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import SwiftUI

struct AddFriendRowView: View {
  var friend: User
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  func addBillPayer() {
    addFriendViewModel.addFriend(friend, "Bill Payer")
  }
  
  func addOwer() {
    addFriendViewModel.addFriend(friend, "Ower")
  }
  
  var body: some View {
    if !addFriendViewModel.addedFriends.contains(where: { $0.user.email == friend.email }) {
      HStack(spacing: 0) {
        Text("\(friend.full_name)")
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
