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
  
  var body: some View {
    let binding = Binding<String>(get: {
      self.searchField
    }, set: {
      self.searchField = $0
      self.usersViewModel.search(searchText: self.searchField)
    })

    ZStack {
      Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
      NavigationStack {
        VStack {
          HStack {
            ZStack {
              Rectangle()
                .foregroundColor(.white)
              HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: binding)
                .tint(.gray)
               }
              .foregroundColor(.gray)
              .padding(.leading, 13)
             }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
          }
          List {
            ForEach(displayUsers()) { userViewModel in
              UserRowView(curr_user: usersViewModel.getUser(email: authModel.user?.email ?? "")[0].user, friend_user: userViewModel.user)
            }
          }
        }
        .navigationBarTitle("Add Friends")
      }
      .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255), UIColor.white)
    }
  }
  
  func displayUsers() -> [UserViewModel] {
    var displayedUsers : [UserViewModel] = []
    if searchField == "" {
      displayedUsers = self.usersViewModel.userViewModels.filter {
        $0.user.email != authModel.user?.email!
      }
    } else {
      displayedUsers = self.usersViewModel.filteredUserViewModels.filter {
        $0.user.email != authModel.user?.email!
      }
    }

    return displayedUsers
  }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
