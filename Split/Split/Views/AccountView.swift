//
//  AccountView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/29/22.
//

import SwiftUI

struct AccountView: View {
  @EnvironmentObject private var authModel: AuthViewModel
  @State private var balance_owed : Int = 0
  @State private var balance_owed_to : Int = 0
  @State private var email :String = ""
  @State private var full_name : String = ""
  @State private var password : String = ""
  @State private var phone_number : String = ""
  @State var nameInEditMode = false
  @State var phoneInEditMode = false
  @ObservedObject var userViewModel = UserViewModel(user: User( balance_owed: 0, balance_owed_to: 0, email: "", full_name: "", phone_number: ""))
  @ObservedObject var usersViewModel = UsersViewModel()
//  @State var user : User = User()

  var body: some View {
    VStack{
      Image(systemName: "person.circle").resizable().frame(width: 30, height: 30)
      HStack {
        if nameInEditMode {
          TextField("Enter your User Name", text: $full_name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
          .autocapitalization(.words)
          .disableAutocorrection(true)
         } else {
            Text("Username: \(full_name)").font(.system(size: 20))
         }
         
        Button(action: {
          self.nameInEditMode.toggle()
        }) {
          Text(nameInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
          .foregroundColor(Color.blue)
        }
      }
         
      HStack {
        if phoneInEditMode {
          TextField("Enter your Phone Number", text: $phone_number).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
          .autocapitalization(.words)
          .disableAutocorrection(true)
        } else {
            Text("Phone Number: \(phone_number)").font(.system(size: 20))
        }
            
        Button(action: {
          self.phoneInEditMode.toggle()
          var user : User = usersViewModel.getUser(email: authModel.user?.email ?? "")[0].user
          user.phone_number = phone_number
          usersViewModel.userRepository.update(user)
        }) {
          Text(phoneInEditMode ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
          .foregroundColor(Color.blue)
        }
      }
      Text("Email: \(authModel.user?.email ?? "")")
      Text("Test: \(usersViewModel.getUser(email: authModel.user?.email ?? "")[0].user.email)")
      }.toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) { Button(
          action: { authModel.signOut()
        }, label: {
          Text("Sign Out") .bold().accentColor(.red)
        })
      }
    }
    .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
