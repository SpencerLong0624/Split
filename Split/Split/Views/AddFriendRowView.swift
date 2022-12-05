//
//  AddFriendRowView.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import SwiftUI

struct AddFriendRowView: View {
  var friend: Friend
  
  func addBillPayer() {
    
  }
  
  func addOwer() {
    
  }
  
  var body: some View {
    HStack(spacing: 0) {
      Text("\(friend.user_id2)")
        .frame(maxWidth: .infinity, alignment: .leading)
      Button("Bill Payer", action: addBillPayer)
        .padding()
        .clipShape(Capsule())
        .background(.green)
        .tint(.white)
        .cornerRadius(6)
        .frame(maxWidth: .infinity, alignment: .center)
      Button("Ower", action: addOwer)
        .padding()
        .clipShape(Capsule())
        .background(.red)
        .tint(.white)
        .cornerRadius(6)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
  }
}
