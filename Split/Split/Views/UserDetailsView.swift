//
//  UserDetailsView.swift
//  Split
//
//  Created by Anthony A Lees on 12/7/22.
//

import SwiftUI

struct UserDetailsView: View {
  @State var curr_user : User
  @State var friend_user : User
  @ObservedObject var usersViewModel = UsersViewModel()
  
  var body: some View {
    VStack {
      Text(friend_user.email)
        .font(.largeTitle)
        .fontWeight(.ultraLight)
        .multilineTextAlignment(.center)
      if friend_user.friends.contains(curr_user.email) {
        Text("User has added you as friend.")
      } else {
        Text("User has not added you as friend.")
      }
      if curr_user.friends.contains(friend_user.email) {
        Text("User has been added as friend.")
      }
      else {
        Button("Add User as Friend") {
          curr_user.friends.append(friend_user.email)
          usersViewModel.userRepository.update(curr_user)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(red: 76/255, green: 229/255, blue: 177/255))
        .clipShape(Capsule())
      }
      Spacer()
    }
  }
}
