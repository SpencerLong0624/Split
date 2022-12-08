//
//  FriendRowView.swift
//  Split
//
//  Created by Spencer Long on 12/5/22.
//

import SwiftUI

struct FriendRowView: View {
  var friendRole: friendRole
  var body: some View {
    VStack(alignment: .leading) {
      Text("\(friendRole.user.full_name)")
      if friendRole.role == "Bill Payer" {
        Text("\(friendRole.role)")
        .font(.caption)
        .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
      } else {
        Text("\(friendRole.role)")
        .font(.caption)
        .foregroundColor(.red)
      }
    }
  }
}
