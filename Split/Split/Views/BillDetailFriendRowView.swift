//
//  BillDetailFriendRowView.swift
//  Split
//
//  Created by Anthony A Lees on 12/8/22.
//

import SwiftUI

struct BillDetailFriendRowView: View {
  var person: String
  var usersViewModel : UsersViewModel
  
  var body: some View {
    Text(usersViewModel.getUser(email: person)[0].user.full_name)
  }
}
