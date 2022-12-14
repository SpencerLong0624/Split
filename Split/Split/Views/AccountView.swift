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
            VStack{
                Text("EMAIL")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
                Form{
                    Text("\(authModel.user?.email ?? "")")
                        .font(.system(size: 20))
                }
                Text("FULL NAME")
                Form{
                    HStack {
                        if nameInEditMode {
                            TextField("Enter your Full Name", text: $full_name)
                                .tint(.green)
                                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 4).font(.system(size: 20))
                                .autocapitalization(.words)
                                .disableAutocorrection(true)
                        } else {
                            Text("\(usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user.full_name)").font(.system(size: 20))
                        }
                        
                        Button(action: {
                            self.nameInEditMode.toggle()
                            var user : User = usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user
                            user.full_name = full_name
                            usersViewModel.userRepository.update(user)
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(Color.blue)
                            Text(nameInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
                                .foregroundColor(Color.blue)
                        }
                    }
                }
                Text("PHONE NUMBER")
                    .font(.system(size: 20))
                Form{
                    HStack {
                        if phoneInEditMode {
                            TextField("Enter your Phone Number", text: $phone_number)
                                .tint(.green)
                                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
                                .autocapitalization(.words)
                                .disableAutocorrection(true)
                        } else {
                            Text("\(usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user.phone_number)").font(.system(size: 20))
                        }
                        
                        Button(action: {
                            self.phoneInEditMode.toggle()
                            var user : User = usersViewModel.getUser(email: authModel.user?.email ?? "anthony@gmail.com")[0].user
                            user.phone_number = phone_number
                            usersViewModel.userRepository.update(user)
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(Color.blue)
                            Text(phoneInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
                                .foregroundColor(Color.blue)
                        }
                    }
                }
               
                Button(
                    action: { authModel.signOut()
                    }, label: {
                        Text("Sign Out") .bold().accentColor(.red)
                    })
            }.navigationTitle("My Account")
            .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
            .background(Color(red: 0.949, green: 0.949, blue: 0.97, opacity: 1.0))

        }
    }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
