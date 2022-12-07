//
//  UserRowView.swift
//  Split
//
//  Created by Anthony A Lees on 12/7/22.
//

import SwiftUI

struct UserRowView: View {
  @State var curr_user : User
  @State var friend_user: User
    var body: some View {
      NavigationLink(
        destination: UserDetailsView(curr_user: curr_user, friend_user: friend_user),
        label: {
          Text(friend_user.email)
          .fontWeight(.bold)
          .font(.body)
        }
      )
    }
}
