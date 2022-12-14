//
//  AccountView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/29/22.
//

import SwiftUI

struct AccountView: View {
  @EnvironmentObject private var authModel: AuthViewModel
  @State private var email :String = ""
  @State private var full_name : String = ""
  @State private var phone_number : String = ""
  @State var nameInEditMode = false
  @State var phoneInEditMode = false
  @ObservedObject var usersViewModel = UsersViewModel()

    var body: some View {
        NavigationStack{
          VStack {
            Form {
              Section(header: Text("Email")) {
                Text("\(authModel.user?.email ?? "")")
              }
              
              Section(header: Text("Full Name")) {
                HStack {
                  if nameInEditMode {
                    TextField("Enter your Full Name", text: $full_name)
                      .tint(.gray)
                      .autocapitalization(.words)
                      .disableAutocorrection(true)
                      .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                      Text("\(usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user.full_name)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                  
                  Button(action: {
                    self.nameInEditMode.toggle()
                    var user : User = usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user
                    user.full_name = full_name
                    usersViewModel.userRepository.update(user)
                  }, label: {
                    Image(systemName: "pencil")
                      .foregroundColor(Color.blue)
                    Text(nameInEditMode ? "Done" : "Edit")
                      .foregroundColor(Color.blue)
                  })
                  .buttonStyle(BorderlessButtonStyle())
                  .frame(maxWidth: .infinity, alignment: .trailing)
                }
              }
              
              Section(header: Text("Phone Number")) {
                HStack {
                    if phoneInEditMode {
                      TextField("Enter your Phone Number", text: $phone_number)
                        .tint(.gray)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text("\(usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user.phone_number)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                  
                  Button(action: {
                    self.phoneInEditMode.toggle()
                    var user : User = usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user
                    user.phone_number = phone_number
                    usersViewModel.userRepository.update(user)
                  }, label: {
                    Image(systemName: "pencil")
                      .foregroundColor(Color.blue)
                    Text(phoneInEditMode ? "Done" : "Edit")
                      .foregroundColor(Color.blue)
                  })
                  .buttonStyle(BorderlessButtonStyle())
                  .frame(maxWidth: .infinity, alignment: .trailing)
                }
              }
              
              Section {
                Button(
                  action: { authModel.signOut()
                }, label: {
                  Text("Sign Out")
                    .bold()
                    .accentColor(.red)
                    .frame(maxWidth: .infinity, alignment: .center)
                })
              }
            }
          }
          .navigationTitle("My Account")
          .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255), UIColor.white)
          .background(Color(red: 0.949, green: 0.949, blue: 0.97, opacity: 1.0))
        }
    }
}
