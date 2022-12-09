//
//  FriendsView.swift
//  Split
//
//  Created by Anthony A Lees on 12/7/22.
//

import SwiftUI

struct FriendsView: View {
  @ObservedObject var usersViewModel = UsersViewModel()
  @EnvironmentObject private var authModel: AuthViewModel
  @State var searchField: String = ""
  @State var displayedUsers : [UserViewModel] = []
  
  var body: some View {
    let binding = Binding<String>(get: {
      self.searchField
    }, set: {
      self.searchField = $0
      self.usersViewModel.search(searchText: self.searchField)
      self.displayBills()
    })
    
    NavigationStack {
      VStack {
        TextField("Search for a friend with their email", text: binding)
          .tint(.black)
        List {
          ForEach(displayedUsers) { userViewModel in
            UserRowView(curr_user: usersViewModel.getUser(email: authModel.user?.email ?? "")[0].user, friend_user: userViewModel.user)
          }
        }
      }
      .navigationBarTitle("Search User")
    }
    .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
  }
  
  func loadData() {
    self.displayedUsers = self.usersViewModel.userViewModels
    self.displayedUsers = self.displayedUsers.filter {
      $0.user.email != authModel.user?.email!
    }
  }
  
  func displayBills() {
    if searchField == "" {
      self.displayedUsers = self.usersViewModel.userViewModels
      self.displayedUsers = self.displayedUsers.filter {
        $0.user.email != authModel.user?.email!
      }
    } else {
      self.displayedUsers = self.usersViewModel.filteredUserViewModels
      self.displayedUsers = self.displayedUsers.filter {
        $0.user.email != authModel.user?.email!
      }
    }
  }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
