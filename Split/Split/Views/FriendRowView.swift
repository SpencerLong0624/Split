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
        Text("\(friendRole.friend.user_id2)")
        if friendRole.role == "Bill Payer" {
          Text("\(friendRole.role)")
            .font(.caption)
            .foregroundColor(.green)
        } else {
          Text("\(friendRole.role)")
            .font(.caption)
            .foregroundColor(.red)
        }
      }
    }
}
