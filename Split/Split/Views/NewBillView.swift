//
//  NewBillView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/6/22.
//

import SwiftUI

struct NewBillView: View {
  @State private var title = ""
  @State private var description = ""
  @State private var date = Date()
  @ObservedObject var addFriendViewModel = AddFriendViewModel()
  @ObservedObject var usersViewModel = UsersViewModel()
  @EnvironmentObject private var authModel: AuthViewModel
   
  var body: some View {
    NavigationStack {
      VStack{
        Form {
          if addFriendViewModel.addedFriends.isEmpty {
            Section(header: Text("Friends")){
              NavigationLink(destination: AddFriend(addFriendViewModel: addFriendViewModel, user: usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user)) {
                Text("Add Friends to Bill")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
              }
              Text("No Friends added")
            }
          } else {
            Section(header: Text("Friends")){
              NavigationLink(destination: AddFriend(addFriendViewModel: addFriendViewModel, user: usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user)) {
                Text("Add Friends to Bill")
                .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
              }
              ForEach(addFriendViewModel.addedFriends.sorted {($0.role, $0.user.full_name) < ($1.role, $1.user.full_name)}){
                friendRole in FriendRowView(friendRole: friendRole)
                  .swipeActions(allowsFullSwipe: false) {
                    Button(role: .destructive) {
                      if let index = addFriendViewModel.addedFriends.firstIndex(of: friendRole) {
                        addFriendViewModel.addedFriends.remove(at: index)
                      }
                    } label: {
                      Label("Delete", systemImage: "trash.fill")
                  }
                }
              }
            }
          }
          Section(header: Text("Bill Information")){
            TextField("Enter a Title", text: $title)
              .tint(.black)
            TextField("Enter a description", text: $description)
              .tint(.black)
            DatePicker("Pick a date", selection: $date,displayedComponents: [.date])
                  .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
                  .accentColor(Color(red: 76/255, green: 229/255, blue: 177/255))

            .padding()
            
            if (addFriendViewModel.addedFriends.count > 0 && title != "" && description != "") {
              NavigationLink(destination: AddItemView(billTitle: title, billDescription: description, billDate: date, addFriendViewModel: addFriendViewModel)) {
                Text("Create Bill")
                .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
              }
            }
          }
        }
      }
      .navigationBarTitle("Create a Bill")
    }
    .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255), UIColor.white)
  }
}
