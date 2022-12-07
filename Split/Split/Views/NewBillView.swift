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
                .foregroundColor(.black)
              }
              Text("No Friends added")
            }
          } else {
            Section(header: Text("Friends")){
              NavigationLink(destination: AddFriend(addFriendViewModel: addFriendViewModel, user: usersViewModel.getUser(email: authModel.user?.email ?? "")[0].user)) {
                Text("Add Friends to Bill")
                .fontWeight(.bold)
                .foregroundColor(.black)
              }
              ForEach(addFriendViewModel.addedFriends.sorted {($0.role, $0.name) < ($1.role, $1.name)}){
                friendRole in FriendRowView(friendRole: friendRole)
              }
            }
          }
          Section(header: Text("Bill Information")){
            TextField("Enter a Title", text: $title)
            TextField("Enter a description", text: $description)
            DatePicker("Pick a date", selection: $date,displayedComponents: [.date])
            .padding()
                
            NavigationLink(destination: AddItemView(billTitle: title, billDescription: description, billDate: date, addFriendViewModel: addFriendViewModel)) {
              Text("Create Expense")
              .foregroundColor(Color.green)
            }
          }
        }
      }
      .navigationBarTitle("Add a Bill")
    }
    .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
  }
}
